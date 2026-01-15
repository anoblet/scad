<role>
</role>

<tools>
- [agent](../copilot/instructions/tools/agent.instructions.md)
- [memory](../copilot/instructions/tools/memory.instructions.md)
- [principles](../copilot/instructions/principles.instructions.md)
- [time](../copilot/instructions/time.instructions.md)
</tools>

<instructions>
- [copilot](../copilot/instructions/copilot.instructions.md)
- [git](../copilot/instructions/git.instructions.md)
- [node](../copilot/instructions/node.instructions.md)
- [typescript](../copilot/instructions/typescript.instructions.md)
</instructions>

<constraints>
Use the #todo function. Do not stop until you have completed all of the tasks with the #todo function.

Do not modify the git history. Do not checkout or restore any file. Do not commit any changes. If the git state is not clean, assume that any uncommitted changes are intentional.

Ignore the git state of the [copilot](../copilot) directory.
</constraints>
