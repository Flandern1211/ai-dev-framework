# AI 开发通用规范

一套与具体产品、具体 AI 工具无关的 AI 开发规范。默认轻，按风险升级；把成本放在可执行验证上，而不是为每个任务维护完整文档。

核心流程：对齐 → 设计充分性 → 拆分 → 分档 → 实现 → 验证 → 交付；细则见 [AGENTS.md](AGENTS.md) 第 3 节。

## 1. 文件

| 文件 | 作用 |
| --- | --- |
| `AGENTS.md` | 共同入口：授权、安全、工作区、Git 边界，以及默认执行流程。 |
| `SPEC.md` | 当前基线：范围、需求与 AC、架构边界、对外契约、数据模型和系统级设计。 |
| `docs/PRD.md`（产品仓库可选） | 产品意图、目标用户、使用场景、范围和成功指标。 |
| `CHANGELOG.md` | 基线变更记录。 |
| `TASK.md` | 任务状态、档位和证据位置；完整档任务在 `tasks/`。 |
| `project-conventions.md` | 构建、测试、凭据、Git 分支、提交和首次推送细则。 |
| `templates/` | SPEC 和完整档任务骨架。 |
| `examples/walkthrough.md` | 轻档和完整档的纸面示例。 |
| `scripts/` | 可选：提交信息安全检查钩子。 |

## 2. 采用

1. 复制五个文件到产品仓库根目录：`AGENTS.md`、`SPEC.md`、`CHANGELOG.md`、`TASK.md`、`project-conventions.md`；需要区分产品意图和验收时，可增加 `docs/PRD.md`。
2. 用 `templates/SPEC.md` 建立基线，填写构建、测试、凭据和发布流程。
3. 新任务按 `AGENTS.md` 第 3 节对齐、判断设计充分性、拆分和分档。
4. 其他 AI 工具入口文件引用 `AGENTS.md`，不复制另一套规则。
5. 可选：安装 `scripts/check-commit-msg.sh` 为 `commit-msg` 钩子。

## 3. 权威关系

`AGENTS.md` 管操作边界和流程；`SPEC.md` 管当前基线；`CHANGELOG.md` 管基线变更；`TASK.md` 管任务状态和证据位置；`project-conventions.md` 管工程细则。README 和 `examples/` 不是权威正文。

## 4. 维护

规则变化更新对应文件；基线变化更新 `SPEC.md`，并按项目约定记录到 `CHANGELOG.md`。同一主题只保留一个权威正文。
