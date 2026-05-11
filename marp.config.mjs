import { Marp } from "@marp-team/marp-core";

export default {
  html: true,

  engine: (opts) => {
    const marp = new Marp({
      ...opts,
      html: true
    });

    const originalFence =
      marp.markdown.renderer.rules.fence;

    marp.markdown.renderer.rules.fence = (
      tokens,
      idx,
      options,
      env,
      self
    ) => {
      const token = tokens[idx];

      if (token.info.trim() === "mermaid") {
        const code = token.content.trim();

        return `
<div class="mermaid">
${code}
</div>
`;
      }

      return originalFence(tokens, idx, options, env, self);
    };

    return marp;
  }
};