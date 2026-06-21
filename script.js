// ── Reading progress bar ──
const bar = document.getElementById('read-progress');
window.addEventListener('scroll', () => {
  const scrolled = window.scrollY;
  const total = document.body.scrollHeight - window.innerHeight;
  bar.style.width = (total > 0 ? (scrolled / total) * 100 : 0) + '%';
}, { passive: true });

// ── Nav: scrolled shadow + active link highlighting ──
const nav = document.getElementById('main-nav');
const navLinks = document.querySelectorAll('.nav-links a[data-section]');
const sections = document.querySelectorAll('section[id]');
const backToTop = document.getElementById('back-to-top');

window.addEventListener('scroll', () => {
  const y = window.scrollY;

  // scrolled shadow
  nav.classList.toggle('scrolled', y > 40);

  // back to top button
  backToTop.classList.toggle('visible', y > 400);

  // active nav link
  let current = '';
  sections.forEach(sec => {
    if (y >= sec.offsetTop - 120) current = sec.id;
  });
  navLinks.forEach(a => {
    a.classList.toggle('active', a.dataset.section === current);
  });
}, { passive: true });

// ── Scroll-reveal via IntersectionObserver (bidirectional) ──
const revealEls = document.querySelectorAll('.reveal');
const observer = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.classList.add('visible');
    } else {
      // Only un-reveal when element scrolls back above viewport
      const rect = entry.target.getBoundingClientRect();
      if (rect.top > window.innerHeight * 0.15) {
        entry.target.classList.remove('visible');
      }
    }
  });
}, { threshold: 0.12 });
revealEls.forEach(el => observer.observe(el));

// ── Skill tags staggered reveal (bidirectional) ──
const skillsList = document.getElementById('skills-list');
const skillObs = new IntersectionObserver((entries) => {
  if (entries[0].isIntersecting) {
    const tags = skillsList.querySelectorAll('.skill-tag');
    tags.forEach((tag, i) => {
      setTimeout(() => tag.classList.add('visible'), i * 60);
    });
  } else {
    const rect = skillsList.getBoundingClientRect();
    if (rect.top > window.innerHeight * 0.15) {
      skillsList.querySelectorAll('.skill-tag').forEach(tag => tag.classList.remove('visible'));
    }
  }
}, { threshold: 0.2 });
skillObs.observe(skillsList);

// ── Timeline items staggered reveal (bidirectional) ──
const timeline = document.getElementById('timeline');
if (timeline) {
  const tlObs = new IntersectionObserver((entries) => {
    if (entries[0].isIntersecting) {
      timeline.querySelectorAll('.tl-item').forEach((item, i) => {
        setTimeout(() => item.classList.add('visible'), i * 120);
      });
    } else {
      const rect = timeline.getBoundingClientRect();
      if (rect.top > window.innerHeight * 0.15) {
        timeline.querySelectorAll('.tl-item').forEach(item => item.classList.remove('visible'));
      }
    }
  }, { threshold: 0.1 });
  tlObs.observe(timeline);
}
