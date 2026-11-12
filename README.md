# AI 开发通用规范

一套优先服务个人开发者与 AI Agent、并能安全接入团队项目的通用开发规范。默认轻，按风险升级；把成本放在可执行验证上，而不是为每个任务维护完整文档。

核心流程：对齐 → 重大决定门 → 设计充分性/按需验证 → 拆分 → 分档 → 实现 → 验证 → 交付；细则见 [AGENTS.md](AGENTS.md) 第 3 节。

## 1. 文件

| 文件 | 作用 |
| --- | --- |
| `AGENTS.md` | 共同入口：授权、安全、工作区、Git 边界，以及默认执行流程。 |
| `SPEC.md` | 当前基线：范围、需求与 AC、架构边界、对外契约、数据模型和系统级设计。 |
| `docs/PRD.md`（产品仓库可选） | 产品意图、目标用户、使用场景、范围和成功指标。 |
| `openapi.yaml` / `schema/`（产品仓库可选） | 对外 API 的机器可读契约源；`SPEC.md` 只链接。 |
| `CHANGELOG.md` | 基线变更记录。 |
| `TASK.md` | 任务状态、档位和证据位置；完整档任务在 `tasks/`。 |
| `project-conventions.md` | 构建、测试、凭据、Git 分支、提交和首次推送细则。 |
| `docs/RUNBOOK.md`（按运行责任可选） | 安装、部署、迁移、回滚、健康检查、恢复和故障操作；已有权威手册时沿用原位置。 |
| `templates/` | SPEC、完整档任务和条件式 RUNBOOK 骨架。 |
| `examples/walkthrough.md` | 轻档和完整档的纸面示例。 |
| `scripts/` | 可选：提交信息安全检查钩子。 |

## 2. 采用

1. 复制五个治理文件到产品仓库根目录：`AGENTS.md`、`SPEC.md`、`CHANGELOG.md`、`TASK.md`、`project-conventions.md`；需要区分产品意图和验收时，可增加 `docs/PRD.md`；有对外 API 时增加 OpenAPI/schema 契约文件，`SPEC.md` 只链接。
2. 由开发者确认采用画像和运行责任，用 `templates/SPEC.md` 建立基线；团队未采用本框架时，团队权威来源优先，本地记录不代表团队状态。
3. 运行责任触发操作手册时，用 `templates/RUNBOOK.md` 建立默认的 `docs/RUNBOOK.md`；已有权威运行文档时沿用并由 SPEC 链接，不创建重复或空手册。
4. 填写构建、测试、凭据和发布流程；未实现或未验证的命令不得写成可用。
5. 新任务按 `AGENTS.md` 第 3 节对齐、判断重大决定和设计充分性、按需设计验证、拆分和分档。
6. 其他 AI 工具入口文件引用 `AGENTS.md`，不复制另一套规则。
7. 可选：安装 `scripts/check-commit-msg.sh` 为 `commit-msg` 钩子。

## 3. 权威关系

`AGENTS.md` 管操作边界和流程；`SPEC.md` 管当前基线和运行设计；`CHANGELOG.md` 管基线变更；`TASK.md` 管任务状态和证据位置；`project-conventions.md` 管工程细则；条件式运行手册只管已确认设计下的可执行操作；对外 API 以 OpenAPI/schema 文件为权威正文，`SPEC.md` 只链接。README 和 `examples/` 不是权威正文。

## 4. 维护

规则变化更新对应文件；基线变化更新 `SPEC.md`，并按项目约定记录到 `CHANGELOG.md`。同一主题只保留一个权威正文。
