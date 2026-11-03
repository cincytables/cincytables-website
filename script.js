// Mobile menu
const toggle = document.querySelector('.nav-toggle');
const nav = document.querySelector('.nav');
if (toggle) {
  toggle.addEventListener('click', () => {
    const open = nav.classList.toggle('open');
    toggle.setAttribute('aria-expanded', open);
  });
}

// Photo viewer for Featured Work and More from the Shop
const box = document.getElementById('lightbox');
if (box) {
  const img = box.querySelector('.lb-img');
  const title = box.querySelector('.lb-title');
  const text = box.querySelector('.lb-text');
  const count = box.querySelector('.lb-count');
  const prev = box.querySelector('.lb-prev');
  const next = box.querySelector('.lb-next');
  let photos = [];
  let i = 0;

  const show = (n) => {
    i = (n + photos.length) % photos.length;
    img.src = photos[i];
    img.alt = `${title.textContent}, photo ${i + 1} of ${photos.length}`;
    count.textContent = `${i + 1} / ${photos.length}`;
  };

  const open = (list, heading, body, start = 0) => {
    photos = list;
    title.textContent = heading;
    text.textContent = body;
    prev.hidden = next.hidden = photos.length < 2;
    show(start);
    box.showModal();
  };

  document.querySelectorAll('.piece').forEach((piece) => {
    piece.querySelector('.piece-open').addEventListener('click', () => {
      open(
        piece.dataset.photos.split(',').map((p) => p.trim()),
        piece.querySelector('h3').textContent,
        piece.querySelector('.piece-full').textContent
      );
    });
  });

  document.querySelectorAll('.shop-grid').forEach((grid) => {
    const items = [...grid.querySelectorAll('.shop-item')];
    const list = items.map((item) => item.querySelector('img').getAttribute('src'));
    items.forEach((item, n) => {
      item.setAttribute('aria-label', `View photo ${n + 1} of ${items.length}`);
      item.addEventListener('click', () => open(list, grid.dataset.title, grid.dataset.text, n));
    });
  });

  prev.addEventListener('click', () => show(i - 1));
  next.addEventListener('click', () => show(i + 1));
  box.querySelector('.lb-close').addEventListener('click', () => box.close());
  box.addEventListener('click', (e) => { if (e.target === box) box.close(); });
  box.addEventListener('keydown', (e) => {
    if (e.key === 'ArrowLeft') show(i - 1);
    if (e.key === 'ArrowRight') show(i + 1);
  });
}
