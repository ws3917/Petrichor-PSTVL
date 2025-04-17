from tools import *

# 设置工作文件夹为 translate
os.chdir("translate")
WEBLATE_PATH = "/home/ws3917/Code/Weblate"
# 【导入部分】正常翻译时例行维护游戏翻译、导入、测试
# 拉取weblate仓库更改
os.system(f"cd {WEBLATE_PATH} && git pull")
for lua_file in src_text_path.glob("*.lua"):
    # 将翻译文件从weblate仓库复制回本地（注意：可能需要改路径）
    for lang in ["zh_CN"]:
        shutil.copy(
            f"{WEBLATE_PATH}/petrichor/{lua_file.stem}/{lang}.json",
            f"strings/{lua_file.stem}/{lang}.json",
        )
    # 生成繁体中文翻译
    convert_zh_to_tw(
        f"strings/{lua_file.stem}/zh_CN.json", f"strings/{lua_file.stem}/zh_TW.json"
    )
    # 将翻译后的文本导入到游戏代码中，改成en_US和zh_TW可以测试其他语言
    IMPORTLANG = "zh_CN"
    import_translation_json(
        lua_file,
        f"strings/{lua_file.stem}/en_US.json",
        f"strings/{lua_file.stem}/{IMPORTLANG}.json",
        f"text/{IMPORTLANG}/{lua_file.stem}.lua",
    )

# 打包游戏
os.chdir("..")
# 记得定期改版本号
os.system(f"7z a -tzip 'translate/gamebuild/Petrichor-V1.love' ./ -xr!translate")
