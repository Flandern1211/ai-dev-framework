# AI 开发通用规范

面向个人开发者与 AI Agent 的轻量开发规范：默认轻档，按风险升级，以可执行验证替代过程性文档。

## 权威入口

- [AGENTS.md](AGENTS.md)：操作边界、授权、安全、流程和完成判定。
- [SPEC.md](SPEC.md)：当前基线、架构、契约、数据模型和稳定 AC。
- [TASK.md](TASK.md)：任务状态、档位、依赖、提交和证据入口。
- [project-conventions.md](project-conventions.md)：测试、凭据、Git、证据和工具细则。

文件权威与冲突处理见 [AGENTS.md 第 1.1 节](AGENTS.md#11-文件权威)。

## 采用

1. 将四个权威入口和 `CHANGELOG.md` 放入产品仓库根目录。
2. 使用 [SPEC 模板](templates/SPEC.md) 建立基线；完整档使用 [任务模板](templates/TASK-full.md)。
3. 承担运行责任且需要保留操作知识时使用 [RUNBOOK 模板](templates/RUNBOOK.md)；已有手册则沿用。
4. 具体案例见 [纸面走查](examples/walkthrough.md)。README 和示例不是权威正文。
5. 可选：安装 `scripts/check-commit-msg.sh` 为 `commit-msg` 钩子。
