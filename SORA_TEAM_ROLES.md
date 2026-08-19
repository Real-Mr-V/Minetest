# Sora Team Roles & Authority

**Project:** Sora Educational Game  
**Repository:** `Real-Mr-V/Minetest`  
**Status:** Active team definition  
**Last updated:** 2026-08-19

## 1. Authority hierarchy

```text
HUMAN PROJECT OWNER / EXECUTIVE MANAGER
                    │
                    ▼
      ChatGPT Desktop — Chief Architect
                    │
          ┌─────────┴─────────┐
          ▼                   ▼
ChatGPT Web              Perplexity
Education Research       Game Design
          │                   │
          └─────────┬─────────┘
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
          Hermes — Engineering Gate
                    │
                    ▼
          HUMAN — Final Acceptance
```

## 2. Roles

### Human Project Owner / Executive Manager

Final authority over project scope, priorities, architecture exceptions, protected-path changes, phase activation, and product acceptance.

### ChatGPT Desktop — Chief Architect / Technical Director

Owns system architecture, technical boundaries, integration strategy, architecture decisions, and project-wide technical governance.

### ChatGPT Web — Education Researcher

Owns official curriculum research, textbook/teacher-guide analysis, learning objectives, educational constraints, and curriculum traceability.

### Perplexity — Game Design & Educational Gameplay

Owns game mechanics, educational gameplay loops, player interaction, progression, feedback, and the translation of approved learning objectives into gameplay.

### Hermes — Technical Lead / Senior Software Engineer

Hermes replaces Claude in the engineering leadership position.

Owns technical specifications, engineering design, dependency analysis, implementation constraints, technical risk analysis, engineering standards, and review of implementation.

Hermes is the technical gate between architecture and production implementation.

Hermes does not replace the Chief Architect and does not have final project authority.

### Qwen Code — Implementation Preparation Engineer

Qwen Code prepares implementation work rather than acting as a second production programmer.

Responsibilities:

- inspect the relevant repository code;
- identify exact files and integration points;
- convert approved specifications into implementation-ready tasks;
- identify dependencies and risks;
- prepare implementation sequence;
- prepare validation checklist.

Qwen Code must not independently redesign the architecture.

### OpenCode — Production Implementation Engineer

OpenCode is the primary production programmer.

Responsibilities:

- implement approved specifications;
- modify authorized source paths;
- perform appropriate local validation;
- report changes and results.

OpenCode must not independently redefine curriculum, gameplay, or architecture.

## 3. Non-overlap rule

Qwen Code and OpenCode are intentionally not peers performing the same job.

```text
Qwen Code = PREPARE
OpenCode  = IMPLEMENT
Hermes    = TECHNICAL GOVERNANCE + REVIEW
```

No feature should be assigned simultaneously to Qwen Code and OpenCode as independent implementation tasks.

If an implementation ambiguity appears:

```text
Qwen Code → Hermes / ChatGPT Desktop
OpenCode  → Hermes
```

The implementing agent must not resolve an architectural ambiguity by inventing a new design.

## 4. Removed member

**Claude — REMOVED**

Claude no longer holds any Sora team responsibility. Existing documents and workflow references to Claude as an active team member must be treated as obsolete and replaced by Hermes where the former role was technical leadership/specification/review.

## 5. No-authority-by-default rule

Being listed as a team member does not grant permission to begin work.

An explicit task and workflow handoff are required. The current project remains in pre-development standby until the human project owner authorizes the first feature.
