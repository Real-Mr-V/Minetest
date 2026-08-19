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
          Hermes — Engineering Gate
                    │
                    ▼
          HUMAN — Final Acceptance
```

ChatGPT Web now combines the former Education Researcher and Game Design & Educational Gameplay responsibilities previously split between ChatGPT Web and Perplexity.

## 2. Current roles

### Human Project Owner / Executive Manager

Final authority over scope, priorities, phase activation, architecture exceptions, protected-path changes, and product acceptance.

### ChatGPT Desktop — Chief Architect / Technical Director

Owns system architecture, technical boundaries, integration strategy, architecture decisions, and project-wide technical governance.

### ChatGPT Web — Education Researcher + Game Design & Educational Gameplay

Owns:

- official curriculum research;
- textbook and teacher-guide analysis;
- learning objectives;
- educational constraints and traceability;
- game mechanics;
- educational gameplay loops;
- player interaction;
- progression and feedback;
- mapping approved learning objectives into gameplay.

ChatGPT Web must distinguish official educational facts from design inference. It does not own production code or technical architecture.

### Hermes — Technical Lead / Senior Software Engineer

Hermes replaces Claude in the engineering leadership position.

Owns:

- technical specifications;
- engineering design;
- dependency and integration analysis;
- implementation constraints;
- technical risk analysis;
- engineering standards;
- implementation gate;
- engineering review.

Hermes is the technical gate between architecture and production implementation. Hermes does not replace ChatGPT Desktop as Chief Architect and does not possess final project authority.

### Qwen Code — Implementation Preparation Engineer

Qwen Code prepares implementation work rather than acting as a second production programmer.

Responsibilities:

- inspect relevant repository code;
- identify exact files and integration points;
- convert approved specifications into implementation-ready tasks;
- identify dependencies and risks;
- prepare implementation sequence;
- prepare validation checklist.

Qwen Code must remain inside the approved architecture and technical specification.

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

## 4. Removed members

### Claude — REMOVED

Claude no longer holds any Sora team responsibility. References to Claude as an active team member are obsolete.

### Perplexity — REMOVED

Perplexity no longer holds any Sora team responsibility. Its Game Design & Educational Gameplay responsibilities are now owned by ChatGPT Web.

## 5. No-authority-by-default rule

Being listed as a team member does not grant permission to begin work.

An explicit task and workflow handoff are required. The current project remains in pre-development standby until the human project owner authorizes the first feature.
