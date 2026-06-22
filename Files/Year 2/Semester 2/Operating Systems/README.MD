# 📘 Operating Systems

**Year 2 · Semester 2**

This course examined how operating systems manage hardware resources — covering process management, scheduling, memory allocation, file systems, concurrency, and inter-process communication.

---

## 📂 Work

No assignment or lab subfolders recorded for this course.

---

## 📖 What I Learned

Operating Systems explained what happens beneath every program I write. I learned how the OS creates and schedules processes, how virtual memory allows programs to use more memory than is physically available, how file systems organise persistent data, and how concurrent processes synchronise without creating race conditions or deadlocks.

These concepts are directly relevant to data engineering — understanding how an OS allocates resources helps explain why Spark jobs behave the way they do, why memory management matters in Python, and how distributed systems handle concurrency.

---

## 💭 Reflection

**What I gained:** A clearer mental model of the environment in which programs run. Knowing that processes compete for CPU time, that context switching has a cost, and that memory is managed in pages has made me more thoughtful about the performance implications of the code I write.

**Suggestions for improvement:** More programming exercises — implementing simplified versions of schedulers, memory allocators, or file system structures — would make the OS concepts more tangible. Describing how a page fault works is less effective than implementing a simple page replacement algorithm.

**Other thoughts:** Operating Systems is often seen as distant from application development, but its relevance to data engineering is direct. Understanding process management and memory allocation is essential for tuning data pipelines, diagnosing performance issues in Spark jobs, and understanding why cloud resource configuration choices matter.

---

<p align="left"><sub><a href="../README.MD">← Back to Semester 2</a></sub></p>
