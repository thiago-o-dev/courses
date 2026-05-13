import { Marp } from "@marp-team/marp-core";

// Injected into every presentation

const MERMAID_SCRIPT = `<script type="module">
  import mermaid from 'https://cdn.jsdelivr.net/npm/mermaid@11/dist/mermaid.esm.min.mjs';

  mermaid.initialize({
    startOnLoad: false,
    theme: 'dark',
    flowchart: {
      useMaxWidth: false,
      htmlLabels: false,
      curve: 'basis',
    },
    themeVariables: {
      fontFamily: 'ui-sans-serif, system-ui, sans-serif',
      fontSize: '16px',
    },
  });

  async function renderAll() {
    const CANVAS_W = 1400;
    const CANVAS_H = 480;
    const containers = document.querySelectorAll('div.mermaid');

    for (const el of containers) {
      const code = el.textContent.trim();
      const id = 'mermaid-' + crypto.randomUUID();

      Object.assign(el.style, {
        width:      CANVAS_W + 'px',
        height:     CANVAS_H + 'px',
        overflow:   'hidden',
        visibility: 'hidden',
        position:   'absolute',
      });

      let svg;
      try {
        ({ svg } = await mermaid.render(id, code));
      } catch (err) {
        el.textContent = 'Mermaid error: ' + err.message;
        continue;
      }

      const parser = new DOMParser();
      const doc    = parser.parseFromString(svg, 'image/svg+xml');
      const svgEl  = doc.querySelector('svg');

      if (svgEl) {
        const w = parseFloat(svgEl.getAttribute('width')  || CANVAS_W);
        const h = parseFloat(svgEl.getAttribute('height') || CANVAS_H);
        if (!svgEl.getAttribute('viewBox')) {
          svgEl.setAttribute('viewBox', \`0 0 \${w} \${h}\`);
        }
        svgEl.removeAttribute('width');
        svgEl.removeAttribute('height');
        svgEl.setAttribute('preserveAspectRatio', 'xMidYMid meet');
      }

      Object.assign(el.style, {
        width: '', height: '', overflow: '', visibility: '', position: '',
      });

      el.innerHTML = svgEl ? svgEl.outerHTML : svg;
    }
  }

  document.fonts.ready.then(() => renderAll());
<\/script>`;

const MERMAID_STYLE = `<style>
  section .mermaid {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
  }
  section .mermaid svg {
    width: 100%;
    height: auto;
  }
</style>`;

export default {
  html: true,

  engine: (opts) => {
    const marp = new Marp({ ...opts, html: true });

    // Fence override: render ```mermaid blocks as divs
    const originalFence = marp.markdown.renderer.rules.fence;
    marp.markdown.renderer.rules.fence = (tokens, idx, options, env, self) => {
      const token = tokens[idx];
      if (token.info.trim() === 'mermaid') {
        return `<div class="mermaid">${token.content.trim()}</div>`;
      }
      return originalFence(tokens, idx, options, env, self);
    };

    // Render override: prepend script + style to every output
    const originalRender = marp.render.bind(marp);
    marp.render = (markdown, env) => {
      const result = originalRender(markdown, env);
      return {
        ...result,
        html: MERMAID_SCRIPT + MERMAID_STYLE + result.html,
      };
    };

    return marp;
  },
};