# Sora Team Roles & Authority

**Project:** Sora Educational Game  
**Repository:** `Real-Mr-V/Minetest`  
**Status:** Active team definition  
**Last updated:** 2026-08-25

## 1. Current authority hierarchy

```text
HUMAN PROJECT OWNER / EXECUTIVE MANAGER
                    │
                    ▼
      ChatGPT Desktop — Chief Architect
                    │
                    ▼
      ChatGPT Web — Education + Gameplay
                    │
                    ▼
          Hermes — Technical Lead
                    │
                    ▼
          Qwen Code — Preparation
                    │
                    ▼
          OpenCode — Implementation
                    │
                    ▼
          Hermes — Engineering Review
                    │
                    ▼
          HUMAN — Final Acceptance
```

## 2. Current roles

### Human Project Owner / Executive Manager

Final authority over scope, priorities, phase activation, architecture exceptions, protected-path changes, releases, and product acceptance.

### ChatGPT Desktop — Chief Architect / Technical Director

Owns system architecture, technical boundaries, integration strategy, architecture decisions, and project-wide technical governance.

### ChatGPT Web — Education Researcher + Game Design & Educational Gameplay

Owns official curriculum research, textbook and teacher-guide analysis, learning objectives, educational constraints, gameplay mechanics, educational gameplay loops, player interaction, progression, feedback, and mapping approved learning objectives into gameplay.

ChatGPT Web must distinguish official educational facts from design inference. It does not own production code or technical architecture.

### Hermes — Technical Lead / Senior Software Engineer

Hermes is the single Technical Lead.

Owns technical specifications, engineering design, dependency/integration analysis, implementation constraints, technical risk analysis, engineering standards, preparation gate, and engineering review.

Hermes does not replace ChatGPT Desktop as Chief Architect and does not possess final project authority.

### Qwen Code — Implementation Preparation Engineer

Qwen Code prepares implementation work rather than acting as a second production programmer.

Responsibilities:

- inspect relevant repository code;
- identify exact files and integration points;
- convert approved specifications into implementation-ready tasks;
- identify dependencies and risks;
- prepare implementation sequence;
- prepare validation checklist;
- prepare scaffolding only where explicitly authorized.

Qwen Code must remain inside the approved architecture and technical specification. It does not own production implementation.

### OpenCode — Production Implementation Engineer

OpenCode is the primary production programmer.

Responsibilities:

- implement approved specifications;
- modify authorized source paths;
- perform appropriate local validation;
- report exact changes and results.

OpenCode must not independently redefine curriculum, gameplay, or architecture.

## 3. Non-overlap rule

Qwen Code and OpenCode are intentionally not peers performing the same job.

```text
Qwen Code = PREPARE
OpenCode  = IMPLEMENT
Hermes    = TECHNICAL GOVERNANCE + REVIEW
```

No feature should be assigned simultaneously to Qwen Code and OpenCode as independent implementation tasks.

## 4. Removed members

### Claude — REMOVED

Claude no longer holds any Sora team responsibility.

### Perplexity — REMOVED

Perplexity no longer holds any Sora team responsibility. Its Game Design & Educational Gameplay responsibilities are owned by ChatGPT Web.

## 5. Current active assignment

GitHub Issue #1 is the current development order:

**SORA: Initial spawn and story-first development handoff**

The immediate implementation chain is:

```text
Issue #1
  ↓
Hermes — technical specification
  ↓
Qwen Code — preparation
  ↓
Hermes — gate
  ↓
OpenCode — implementation
  ↓
Hermes — review
  ↓
Human — acceptance
```

The first-entry spawn requirement is `541, 17, -98`. The main story phase must be addressed before educational lesson implementation.

## 6. No-authority-by-default rule

Being listed as a team member does not grant permission to begin unrelated work.

The current Issue #1 authorization is limited to its stated scope. Any new feature requires an explicit task/handoff.
