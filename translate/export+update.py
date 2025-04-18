from tools import *

# 设置工作文件夹为 translate
os.chdir("translate")
WEBLATE_PATH = "/home/ws3917/Code/Weblate"

# 【导出部分】只有第一次或原文有更新的时候需要跑一次，正常情况下不需要
# 将原文带文本的lua文件复制到text文件夹 - 【注意】只有第一次和版本升级时需要运行！
# 如果text/en_US文件夹已经有文件，就千万千万不要再执行了（否则原文会被替换成半英半中的混合体）
# initialize_files_lua()
os.system(f"cd {WEBLATE_PATH} && git pull")
for lua_file in src_text_path.glob("*.lua"):
    # 英文，中文文本备份与更新
    for lang in ["en_US", "zh_CN"]:
        shutil.copy(
            f"{WEBLATE_PATH}/petrichor/{lua_file.stem}/{lang}.json",
            f"strings_old/{lua_file.stem}/{lang}.json",
        )
    export_translation_json(lua_file, f"strings/{lua_file.stem}/en_US.json")
    # 根据lua生成英文文本json
    # 有版本更新时，根据strings_old和strings更新中文翻译，并生成需要补的文本列表
    # 方便版本升级时翻译
    # 【注意】在更新版本前，务必把之前的strings目录复制到strings_old
    update_translation_json(
        f"strings_old/{lua_file.stem}/en_US.json",
        f"strings/{lua_file.stem}/en_US.json",
        f"strings_old/{lua_file.stem}/zh_CN.json",
        f"strings/{lua_file.stem}/zh_CN.json",
    )
    # 将翻译文件复制到weblate仓库（注意：可能需要改路径）
    for lang in ["en_US", "zh_CN"]:
        shutil.copy(
            f"strings/{lua_file.stem}/{lang}.json",
            f"{WEBLATE_PATH}/petrichor/{lua_file.stem}/{lang}.json",
        )

# git推送到weblate
os.system(
    f'cd {WEBLATE_PATH} && git add -A && git commit -m "{datetime.today()} - Update Translation" && git push origin main'
)
