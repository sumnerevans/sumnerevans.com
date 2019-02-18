const portfolio_items = document.getElementsByClassName('portfolio-item');

function setLinkText(link) {
  if (JSON.parse(link.getAttribute('data-collapsed'))) {
    link.innerHTML = 'Show more...';
  } else {
    link.innerHTML = 'Show less...';
  }
}

function link_onclick(e) {
  const link = e.target;
  let collapsed = JSON.parse(link.getAttribute('data-collapsed'));
  collapsed = !collapsed;

  link.setAttribute('data-collapsed', collapsed);

  const portfolio_item = link.closest('.portfolio-item');
  if (collapsed) {
    portfolio_item.classList.add('collapsed');
  } else {
    portfolio_item.classList.remove('collapsed');
  }
  setLinkText(link);
}

for (let i = 0; i < portfolio_items.length; i++) {
  const content = portfolio_items[i].getElementsByClassName('content')[0];
  if (!content) {
    continue;
  }

  const link = document.createElement('a');
  link.setAttribute('href', 'javascript:void(0)');
  link.setAttribute('class', 'expand-link');
  link.addEventListener('click', link_onclick);

  const collapsed = portfolio_items[i].classList.contains('collapsed');

  link.setAttribute('data-collapsed', collapsed);
  setLinkText(link);
  content.appendChild(link);
}
