import re, os
import shutil
import json, zhconv
from datetime import datetime
from pathlib import Path

src_text_path = Path("text/en_US")


# 复制原始文件的函数
def initialize_files_lua():
    filelist = Path("filelist.txt")
    with filelist.open("w", encoding="utf-8") as f:
        if src_text_path.exists():
            shutil.rmtree(src_text_path)
        src_text_path.mkdir(parents=True)

        for lua_file in Path("../code").rglob("*.lua"):
            with lua_file.open("r", encoding="utf-8") as f2:
                content = f2.read()
                match = re.search(r"local function textGen.*?\n(?:.*\n)*?end", content)
                if match:
                    shutil.copy(lua_file, src_text_path)
                    f.write(f"{lua_file}\n")


# 使用正则匹配
def export_translation_json(input_file, output_file, blank=False):
    input_file = Path(input_file)
    output_file = Path(output_file)
    if not input_file.exists():
        return
    output_file.parent.mkdir(parents=True, exist_ok=True)

    transdict = {}
    with input_file.open("r", encoding="utf-8") as f2:
        content = re.search(
            r"local function textGen.*?\n(?:.*\n)*?end", f2.read()
        ).group(0)
        content = re.sub(r'(?<=[^\\\]]")(,\s*\n?\s*[^\\\[]")', r',\n"', content)
        content = re.sub(r'(?<=[^\\\]]")(\s*\n?\s*[^\\\[]\})', r"}", content)
        content = (
            content.replace("\u0010", "\u2190")
            .replace("\u0011", "\u2191")
            .replace("\u0012", "\u2192")
            .replace("\u0013", "\u2193")
        )
        multiplelines = [
            "".join(p)
            for p in re.findall(
                r'\{[\s\n]*((?:"(?:[^"\\]|\\.)*"\s*,?\s*)+)[\s\n]*\}',
                content,
            )
        ]
        multiplelines_single = []
        for ct, line in enumerate(multiplelines):
            newline = re.findall(r'"((?:\\.|[^"\\])*)"', line)
            transdict[f"{ct}-multiple"] = (
                "" if blank else "\n".join(newline).replace('\\"', '"')
            )
            multiplelines_single.extend(newline)

        singlelines = re.findall(
            r'(?<=[{\(\s\n])"((?:\\.|[^"\\])*)"(?=[}\),\s\n])', content
        )

        singlelines_unique = []
        for line in singlelines:
            if line not in multiplelines_single:
                singlelines_unique.append(line)

        for ct, line in enumerate(singlelines_unique):
            transdict[f"{ct}-single"] = "" if blank else line.replace('\\"', '"')

    with output_file.open("w", encoding="utf-8") as f:
        json.dump(transdict, f, ensure_ascii=False, indent=4)


def convert_zh_to_tw(input_file, output_file):
    with open(input_file, "r", encoding="utf-8") as f:
        content = f.read()
    content_tw = zhconv.convert(content, "zh-tw")
    # 寫入檔案
    with open(output_file, "w", encoding="utf-8") as f:
        f.write(content_tw)


# 从新json中更新旧翻译
def update_translation_json(old_srctext, new_srctext, old_dsttext, new_dsttext):
    with open(old_srctext, "r", encoding="utf-8") as f:
        old_src = json.load(f)
    with open(new_srctext, "r", encoding="utf-8") as f:
        new_src = json.load(f)
    with open(old_dsttext, "r", encoding="utf-8") as f:
        old_dst = json.load(f)

    # 首先从old_src, old_dst建立翻译字典
    translation_dict = {}
    for key, item in old_src.items():
        if key in old_dst and old_dst[key] != "":
            translation_dict[item] = old_dst[key]
    # 然后从new_src中获取新的翻译
    dst = {}
    newtext_dict = {}
    notfound_dict = {}
    for key, item in new_src.items():
        if item in translation_dict.keys():
            dst[key] = translation_dict[item]
        else:
            dst[key] = ""
            newtext_dict[key] = item

    for item in translation_dict:
        if item not in new_src.values():
            notfound_dict[item] = translation_dict[item]

    # 将翻译写入新json
    with open(new_dsttext, "w", encoding="utf-8") as f:
        json.dump(dst, f, ensure_ascii=False, indent=4)

    # 将未找到的翻译写入json
    with open(
        new_dsttext.replace(".json", "") + "-newtext.txt", "w+", encoding="utf-8"
    ) as f:
        json.dump(newtext_dict, f, ensure_ascii=False, indent=4)

    with open(
        new_dsttext.replace(".json", "") + "-notfound.txt", "w+", encoding="utf-8"
    ) as f:
        json.dump(notfound_dict, f, ensure_ascii=False, indent=4)


# 使用正则匹配
def import_translation_json(
    input_lua, input_src_json, input_translated_json, output_lua
):
    input_lua = Path(input_lua)
    output_lua = Path(output_lua)
    if not input_lua.exists():
        return
    output_lua.parent.mkdir(parents=True, exist_ok=True)

    with open(input_src_json, "r", encoding="utf-8") as f1:
        src = json.load(f1)
    with open(input_translated_json, "r", encoding="utf-8") as f2:
        trans = json.load(f2)

    with input_lua.open("r", encoding="utf-8") as f2:
        content = f2.read()

    # 替换控制符
    content = (
        content.replace("\u0010", "\u2190")
        .replace("\u0011", "\u2191")
        .replace("\u0012", "\u2192")
        .replace("\u0013", "\u2193")
    )

    for key, value in src.items():
        if key not in trans or not trans[key]:
            continue

        if "multiple" in key:
            # 生成原始匹配的正则
            lines_src = [line.replace('"', '\\"') for line in value.split("\n")]
            lines_trans = [
                re.sub(r'(\\[n\\"]|")', r"\\\1", line)
                for line in trans[key].split("\n")
            ]

            escaped_src = r",\s*".join([re.escape(f'"{l}"') for l in lines_src])
            replacement = "{\n" + ",\n".join([f'"{l}"' for l in lines_trans]) + "\n}"

            pattern = re.compile(r"\{\s*" + escaped_src + r"\s*\}")
            content = pattern.sub(replacement, content)

        elif "single" in key:
            src_text = re.escape(value.replace('"', '\\"'))
            trans_text = re.sub(r'(\\[n\\"]|")', r"\\\1", trans[key])
            pattern = re.compile(r'"' + src_text + r'"')
            content = pattern.sub(f'"{trans_text}"', content)

    with output_lua.open("w", encoding="utf-8") as f:
        f.write(content)

    # 读取filelist.txt，把生成的文件导入到对应的路径
    with open("filelist.txt", "r", encoding="utf-8") as f:
        content = f.read().split("\n")
        for line in content:
            if input_lua.stem in line:
                shutil.copy(output_lua, Path(line))
