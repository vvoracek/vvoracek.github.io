#!/bin/bash

# Jekyll Academic Website Setup Script
# This script creates a complete Jekyll website structure for an academic personal site

echo "Setting up your academic Jekyll website..."

# Create main directory structure
mkdir -p _layouts _includes _posts _sass assets/images

# Create _config.yml
cat > _config.yml << 'EOL'
# Site settings
title: Václav Voráček
email: vasek.voracek@gmail.com
description: ""
baseurl: "" # leave empty for user site
url: "https://your-username.github.io"
twitter_username: VaclavVoracekCZ
github_username:  vvoracek
google_scholar: Db13d44AAAAJ

# Build settings
markdown: kramdown
kramdown:
  math_engine: mathjax
theme: minima
plugins:
  - jekyll-feed
  - jekyll-seo-tag

# Navigation
header_pages:
#  - research.md
  - publications.md
#  - teaching.md
  - blog.md

# Collections
collections:
  papers:
    output: true
EOL


# Create Gemfile
cat > Gemfile << 'EOL'
source "https://rubygems.org"

gem "jekyll", "~> 4.2.0"
gem "minima", "~> 2.5"
gem "jekyll-feed", "~> 0.12"
gem "jekyll-seo-tag"
gem "webrick", "~> 1.7"  # Add this line for Ruby 3.0+ compatibility

# Windows and JRuby does not include zoneinfo files, so bundle the tzinfo-data gem
# and associated library.
platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo", "~> 1.2"
  gem "tzinfo-data"
end

# Performance-booster for watching directories on Windows
gem "wdm", "~> 0.1.1", :platforms => [:mingw, :x64_mingw, :mswin]
EOL

# Create index.md (Home page)
cat > index.md << 'EOL'
---
layout: home
---

<img src="assets/images/profile.jpg" alt="Profile Photo" style="width: 200px; float: right; margin-left: 20px;">



I am an (incoming) postdoc at KAUST with Francesco Orabona. I am broadly interested in theoretical aspects of machine learning, mainly:

- Concentration inequalities/sequences
- Trustworthy machine learning

I completed my doctorate in Machine Learning at University of Tuebingen in 2025, advised by Matthias Hein. Prior to that, I have interned in Amazon research and  have received my Bachelor's ('19) and Master's ('21) degree in computer science from Czech Technical University.

In my free time I like math, go, and heavy music.

EOL

# Create research.md
cat > research.md << 'EOL'
---
layout: page
title: Research
permalink: /research/
---

# Research

My research focuses on developing mathematical frameworks for understanding modern machine learning algorithms.

EOL

# Create publications.md
cat > publications.md << 'EOL'
---
layout: page
title: Publications
permalink: /publications/
---

# Publications

## Journal Articles

1. **Your Name**, Coauthor One, Coauthor Two. (2024). "Title of Your Paper." *Journal of Machine Learning Research*, 25(3), 1-35. [PDF](assets/papers/paper1.pdf) | [Code](https://github.com/yourusername/project1)

2. Coauthor One, **Your Name**, Coauthor Three. (2023). "Another Interesting Paper." *Neural Computation*, 35(2), 401-432. [PDF](assets/papers/paper2.pdf) | [Code](https://github.com/yourusername/project2)

## Conference Proceedings

1. **Your Name**, Coauthor One. (2024). "A Novel Approach to Deep Learning." In *Proceedings of the International Conference on Machine Learning (ICML)*, 5521-5530. [PDF](assets/papers/icml2024.pdf) | [Code](https://github.com/yourusername/icml2024)

2. Coauthor Two, **Your Name**, Coauthor Three. (2023). "Statistical Analysis of Neural Networks." In *Advances in Neural Information Processing Systems (NeurIPS)*, 3245-3257. [PDF](assets/papers/neurips2023.pdf) | [Code](https://github.com/yourusername/neurips2023)

## Preprints

1. **Your Name**, Coauthor Four. (2025). "Current Research Direction." arXiv preprint arXiv:2503.12345. [PDF](https://arxiv.org/pdf/2503.12345.pdf)
EOL

# Create blog.md
cat > blog.md << 'EOL'
---
layout: page
title: Blog
permalink: /blog/
---

# Blog

Here I share thoughts, tutorials, and insights on mathematics, machine learning, and academic life.

<ul class="post-list">
  {% for post in site.posts %}
    <li>
      <span class="post-meta">{{ post.date | date: "%b %-d, %Y" }}</span>
      <h3>
        <a class="post-link" href="{{ post.url | relative_url }}">{{ post.title | escape }}</a>
      </h3>
      {{ post.excerpt }}
    </li>
  {% endfor %}
</ul>
EOL

# Create teaching.md
cat > teaching.md << 'EOL'
---
layout: page
title: Teaching
permalink: /teaching/
---

# Teaching
EOL

# Create sample blog post
mkdir -p _posts
cat > _posts/2025-02-10-transformer-architectures.md << 'EOL'
---
layout: post
title:  "Understanding Transformer Architectures"
date:   2025-02-10 10:00:00 -0500
categories: deep-learning transformers
---

# Understanding Transformer Architectures

Transformer architectures have revolutionized many areas of machine learning. In this post, I'll explain the key mathematical concepts behind transformers.

## Self-Attention Mechanism

The core of a transformer is the self-attention mechanism. For a sequence of vectors $\mathbf{X} = [\mathbf{x}_1, \mathbf{x}_2, \ldots, \mathbf{x}_n]$, the self-attention operation computes:

$$\text{Attention}(\mathbf{Q}, \mathbf{K}, \mathbf{V}) = \text{softmax}\left(\frac{\mathbf{Q}\mathbf{K}^T}{\sqrt{d_k}}\right)\mathbf{V}$$

Where:
- $\mathbf{Q} = \mathbf{X}\mathbf{W}_Q$ are the queries
- $\mathbf{K} = \mathbf{X}\mathbf{W}_K$ are the keys
- $\mathbf{V} = \mathbf{X}\mathbf{W}_V$ are the values

And $\mathbf{W}_Q$, $\mathbf{W}_K$, and $\mathbf{W}_V$ are learnable parameter matrices.

## Multi-Head Attention

To capture different aspects of the input sequence, transformers use multiple attention heads:

$$\text{MultiHead}(\mathbf{X}) = [\text{head}_1, \text{head}_2, \ldots, \text{head}_h]\mathbf{W}^O$$

Where each head is computed as:

$$\text{head}_i = \text{Attention}(\mathbf{X}\mathbf{W}^Q_i, \mathbf{X}\mathbf{W}^K_i, \mathbf{X}\mathbf{W}^V_i)$$

This allows the model to jointly attend to information from different representation subspaces.

## Feed-Forward Networks

Each transformer block also contains a position-wise feed-forward network:

$$\text{FFN}(\mathbf{x}) = \max(0, \mathbf{x}\mathbf{W}_1 + \mathbf{b}_1)\mathbf{W}_2 + \mathbf{b}_2$$

## Conclusion

The combination of self-attention and feed-forward networks makes transformers extremely powerful for sequence modeling tasks. In future posts, I'll explore some recent advances in transformer architectures.
EOL

# Create a second sample blog post
cat > _posts/2025-01-15-optimization-methods.md << 'EOL'
---
layout: post
title:  "Modern Optimization Methods for Deep Learning"
date:   2025-01-15 14:30:00 -0500
categories: optimization deep-learning
---

# Modern Optimization Methods for Deep Learning

In this post, I'll discuss some modern optimization techniques used in training deep neural networks.

## Beyond Stochastic Gradient Descent

While vanilla SGD is the foundation of deep learning optimization, modern techniques build upon it significantly:

$$\theta_{t+1} = \theta_t - \eta \nabla_\theta \mathcal{L}(\theta_t)$$

## Momentum Methods

Momentum methods maintain a moving average of gradients:

$$
\begin{align}
m_t &= \beta m_{t-1} + (1-\beta) \nabla_\theta \mathcal{L}(\theta_t) \\
\theta_{t+1} &= \theta_t - \eta m_t
\end{align}
$$

This helps navigate ravines and avoid local minima.

## Adaptive Learning Rate Methods

Adam combines the benefits of momentum with per-parameter adaptive learning rates:

$$
\begin{align}
m_t &= \beta_1 m_{t-1} + (1-\beta_1) \nabla_\theta \mathcal{L}(\theta_t) \\
v_t &= \beta_2 v_{t-1} + (1-\beta_2) (\nabla_\theta \mathcal{L}(\theta_t))^2 \\
\hat{m}_t &= \frac{m_t}{1-\beta_1^t} \\
\hat{v}_t &= \frac{v_t}{1-\beta_2^t} \\
\theta_{t+1} &= \theta_t - \frac{\eta}{\sqrt{\hat{v}_t} + \epsilon} \hat{m}_t
\end{align}
$$

## Learning Rate Schedules

Cosine annealing with warm restarts can be particularly effective:

$$\eta_t = \eta_{min} + \frac{1}{2}(\eta_{max} - \eta_{min})\left(1 + \cos\left(\frac{T_{cur}}{T_{max}}\pi\right)\right)$$

Where $T_{cur}$ is the number of epochs since the last restart and $T_{max}$ is the number of epochs until the next restart.

## Conclusion

Choosing the right optimization method and properly tuning its hyperparameters remains both an art and a science in deep learning. In my next post, I'll discuss some experimental results comparing these methods across different architectures.
EOL

# Create MathJax support file
mkdir -p _includes
cat > _includes/head.html << 'EOL'
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  {%- seo -%}
  <link rel="stylesheet" href="{{ "/assets/main.css" | relative_url }}">
  {%- feed_meta -%}
  {%- if jekyll.environment == 'production' and site.google_analytics -%}
    {%- include google-analytics.html -%}
  {%- endif -%}
  
  <!-- MathJax configuration -->
  <script type="text/javascript">
    window.MathJax = {
      tex: {
        inlineMath: [['$', '$'], ['\\(', '\\)']],
        displayMath: [['$$', '$$'], ['\\[', '\\]']],
        processEscapes: true
      },
      options: {
        skipHtmlTags: ['script', 'noscript', 'style', 'textarea', 'pre', 'code']
      }
    };
  </script>
  <script type="text/javascript" id="MathJax-script" async
    src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js">
  </script>
</head>
EOL

# Create custom layout
mkdir -p _layouts
cat > _layouts/default.html << 'EOL'
<!DOCTYPE html>
<html lang="{{ page.lang | default: site.lang | default: "en" }}">

  {%- include head.html -%}

  <body>
    {%- include header.html -%}

    <main class="page-content" aria-label="Content">
      <div class="wrapper">
        {{ content }}
      </div>
    </main>

    {%- include footer.html -%}
  </body>

</html>
EOL

# Create post layout
cat > _layouts/post.html << 'EOL'
---
layout: default
---
<article class="post h-entry" itemscope itemtype="http://schema.org/BlogPosting">

  <header class="post-header">
    <h1 class="post-title p-name" itemprop="name headline">{{ page.title | escape }}</h1>
    <p class="post-meta">
      <time class="dt-published" datetime="{{ page.date | date_to_xmlschema }}" itemprop="datePublished">
        {%- assign date_format = site.minima.date_format | default: "%b %-d, %Y" -%}
        {{ page.date | date: date_format }}
      </time>
      {%- if page.author -%}
        • <span itemprop="author" itemscope itemtype="http://schema.org/Person"><span class="p-author h-card" itemprop="name">{{ page.author }}</span></span>
      {%- endif -%}</p>
  </header>

  <div class="post-content e-content" itemprop="articleBody">
    {{ content }}
  </div>

  <a class="u-url" href="{{ page.url | relative_url }}" hidden></a>
</article>
EOL

# Create page layout
cat > _layouts/page.html << 'EOL'
---
layout: default
---
<article class="post">

  <header class="post-header">
    <h1 class="post-title">{{ page.title | escape }}</h1>
  </header>

  <div class="post-content">
    {{ content }}
  </div>

</article>
EOL

# Create home layout
cat > _layouts/home.html << 'EOL'
---
layout: default
---

<div class="home">
  {%- if page.title -%}
    <h1 class="page-heading">{{ page.title }}</h1>
  {%- endif -%}

  {{ content }}

  {%- if site.posts.size > 0 -%}
    <h2 class="post-list-heading">{{ page.list_title | default: "Recent Posts" }}</h2>
    <ul class="post-list">
      {%- for post in site.posts limit:3 -%}
      <li>
        {%- assign date_format = site.minima.date_format | default: "%b %-d, %Y" -%}
        <span class="post-meta">{{ post.date | date: date_format }}</span>
        <h3>
          <a class="post-link" href="{{ post.url | relative_url }}">
            {{ post.title | escape }}
          </a>
        </h3>
        {%- if site.show_excerpts -%}
          {{ post.excerpt }}
        {%- endif -%}
      </li>
      {%- endfor -%}
    </ul>

    <p class="rss-subscribe">See all posts in the <a href="{{ "/blog/" | relative_url }}">blog</a></p>
  {%- endif -%}

</div>
EOL

#custom social
cat > _includes/social.html << 'EOL'
<div class="horizontal-social-list">
  {%- if site.github_username -%}
  <a href="https://github.com/{{ site.github_username | cgi_escape | escape }}" title="{{ site.github_username | escape }}" class="social-icon">
    <svg class="svg-icon"><use xlink:href="{{ '/assets/minima-social-icons.svg#github' | relative_url }}"></use></svg>
  </a>
  {%- endif -%}
  
  {%- if site.twitter_username -%}
  <a href="https://twitter.com/{{ site.twitter_username | cgi_escape | escape }}" title="{{ site.twitter_username | escape }}" class="social-icon">
    <svg class="svg-icon"><use xlink:href="{{ '/assets/minima-social-icons.svg#twitter' | relative_url }}"></use></svg>
  </a>
  {%- endif -%}
  
  {%- if site.google_scholar -%}
  <a href="https://scholar.google.com/citations?user={{ site.google_scholar | cgi_escape | escape }}" title="Google Scholar" class="social-icon">
    <svg class="svg-icon" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
      <path d="M5.242 13.769L0 9.5 12 0l12 9.5-5.242 4.269C17.548 11.249 14.978 9.5 12 9.5c-2.977 0-5.548 1.748-6.758 4.269zM12 10a7 7 0 1 0 0 14 7 7 0 0 0 0-14z"/>
    </svg>
  </a>
  {%- endif -%}

  {%- for mst in site.minima.social_links -%}
    {%- if mst.platform == "github" -%}
      <a href="https://github.com/{{ mst.user_url }}" title="{{ mst.platform | capitalize }}" class="social-icon">
        <svg class="svg-icon"><use xlink:href="{{ '/assets/minima-social-icons.svg#github' | relative_url }}"></use></svg>
      </a>
    {%- endif -%}
  {%- endfor -%}
</div>
EOL

# Create or update main.scss with forceful horizontal styling
if [ -f assets/main.scss ]; then
  # File exists, append the new styles
  cat >> assets/main.scss << 'EOL'

/* Forceful horizontal social icons styling */
.horizontal-social-list {
  display: flex !important;
  flex-direction: row !important;
  margin: 0 !important;
  padding: 0 !important;
}

.social-icon {
  display: inline-block !important;
  margin-right: 12px !important;
  text-decoration: none !important;
}

.svg-icon {
  width: 20px !important;
  height: 20px !important;
  fill: #828282 !important;
  
  &:hover {
    fill: #2a7ae2 !important;
  }
}

/* Override any conflicting styles */
.social-media-list {
  li {
    display: inline-block !important;
    margin-right: 10px !important;
  }
}

.footer-col-2 {
  width: 100% !important;
}
EOL
else
  # File doesn't exist, create it
  mkdir -p assets
  cat > assets/main.scss << 'EOL'
---
---

@import "minima";

/* Forceful horizontal social icons styling */
.horizontal-social-list {
  display: flex !important;
  flex-direction: row !important;
  margin: 0 !important;
  padding: 0 !important;
}

.social-icon {
  display: inline-block !important;
  margin-right: 12px !important;
  text-decoration: none !important;
}

.svg-icon {
  width: 20px !important;
  height: 20px !important;
  fill: #828282 !important;
  
  &:hover {
    fill: #2a7ae2 !important;
  }
}

/* Override any conflicting styles */
.social-media-list {
  li {
    display: inline-block !important;
    margin-right: 10px !important;
  }
}

.footer-col-2 {
  width: 100% !important;
}
EOL
fi

# Create a custom footer.html that forces horizontal layout
cat > _includes/footer.html << 'EOL'
<footer class="site-footer h-card">
  <data class="u-url" href="{{ "/" | relative_url }}"></data>

  <div class="wrapper">
    <div class="footer-col-wrapper">
      <div class="footer-col footer-col-1">
        <ul class="contact-list">
          <li class="p-name">
            {%- if site.author -%}
              {{ site.author | escape }}
            {%- else -%}
              {{ site.title | escape }}
            {%- endif -%}
          </li>
          {%- if site.email -%}
          <li><a class="u-email" href="mailto:{{ site.email }}">{{ site.email }}</a></li>
          {%- endif -%}
        </ul>
      </div>

      <div class="footer-col footer-col-2">
        {%- include social.html -%}
      </div>

      <div class="footer-col footer-col-3">
        <p>{{- site.description | escape -}}</p>
      </div>
    </div>
  </div>
</footer>
EOL



# Add some CSS to make the icons look better
cat >> assets/main.scss << 'EOL'

/* Custom social icons styling */
.social-media-list {
  list-style: none;
  margin-left: 0;
  
  li {
    display: inline-block;
    margin-right: 10px;
  }
  
  .svg-icon {
    width: 20px;
    height: 20px;
    fill: #828282;
    padding-right: 0;
    vertical-align: text-bottom;
    
    &:hover {
      fill: #2a7ae2;
    }
  }
  
  a {
    text-decoration: none;
    display: block;
  }
}
EOL


# Create custom styles
mkdir -p assets
cat > assets/main.scss << 'EOL'
---
---

@import "minima";

// Custom styling
body {
  font-family: 'Roboto', Arial, sans-serif;
  line-height: 1.6;
  max-width: 800px;
  margin: 0 auto;
  padding: 0 20px;
}

.site-header {
  border-top: 5px solid #424242;
  border-bottom: 1px solid #e8e8e8;
  min-height: 55.95px;
  position: relative;
}

.site-title {
  font-size: 1.625rem;
  font-weight: 300;
  line-height: 54px;
  letter-spacing: -1px;
  margin-bottom: 0;
  float: left;
}

h1, h2, h3, h4, h5, h6 {
  font-weight: 400;
  color: #333;
}

a {
  color: #2a7ae2;
  text-decoration: none;
  
  &:hover {
    text-decoration: underline;
  }
}

.post-list {
  margin-left: 0;
  list-style: none;
  
  > li {
    margin-bottom: 30px;
  }
}

.post-meta {
  font-size: 0.875rem;
  color: #828282;
}

.post-link {
  display: block;
  font-size: 1.5rem;
}

img {
  max-width: 100%;
}

.wrapper {
  max-width: 800px;
  margin: 0 auto;
}

code, pre {
  background-color: #f9f9f9;
  border: 1px solid #e8e8e8;
  border-radius: 3px;
  padding: 8px;
}

blockquote {
  color: #828282;
  border-left: 4px solid #e8e8e8;
  padding-left: 15px;
  font-style: italic;
}
EOL

# Create a placeholder for profile image
mkdir -p assets/images
touch assets/images/profile.jpg
echo "Remember to replace this placeholder with your actual profile photo" > assets/images/README.txt

# Create .gitignore file
cat > .gitignore << 'EOL'
_site
.sass-cache
.jekyll-cache
.jekyll-metadata
vendor
.bundle
Gemfile.lock
.DS_Store
EOL

# Create README.md
cat > README.md << 'EOL'
# Academic Personal Website

This is an academic personal website built with Jekyll and hosted on GitHub Pages. It features:

- A minimalist, clean design
- LaTeX support for mathematical notation
- A blog with post categories
- Pages for research, publications, and teaching

## Local Development

To run this site locally:

1. Install Jekyll and Bundler:
   ```
   gem install jekyll bundler
   ```

2. Install dependencies:
   ```
   bundle install
   ```

3. Run the development server:
   ```
   bundle exec jekyll serve
   ```

4. View the site at http://localhost:4000

## Customization

- Edit `_config.yml` to update site-wide settings
- Replace placeholder content in `.md` files with your own
- Add your profile photo to `assets/images/profile.jpg`
- Add new blog posts to the `_posts` directory
- Customize styling in `assets/main.scss`

## Deployment

The site is automatically deployed via GitHub Pages when changes are pushed to the main branch.
EOL

# Create scripts for common tasks
mkdir -p scripts

# Create script for adding new blog posts
cat > scripts/new_post.sh << 'EOL'
#!/bin/bash

# Check if title was provided
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 \"Post Title\""
    exit 1
fi

# Get title from arguments
title="$1"

# Generate filename-friendly version of title
filename=$(echo "$title" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-//g' | sed 's/-$//g')

# Get current date
date=$(date +"%Y-%m-%d")

# Create post file
post_file="_posts/$date-$filename.md"

# Create post content
cat > "$post_file" << EOF
---
layout: post
title:  "$title"
date:   $(date +"%Y-%m-%d %H:%M:%S %z")
categories: uncategorized
---

Write your post content here. This will support LaTeX math like this:

$$
f(x) = \int_{-\infty}^{\infty} \hat{f}(\xi) e^{2 \pi i \xi x} d\xi
$$

And inline math like $E = mc^2$.

## Add Headings

Add your content here.

## Code Examples

\`\`\`python
def hello_world():
    print("Hello, world!")
\`\`\`

## Images

![Alt text](path/to/image.jpg)

## Links

[Link text](http://example.com)
EOF

echo "Created new post: $post_file"
chmod +x "$post_file"
EOL

# Make scripts executable
chmod +x scripts/new_post.sh

echo "Jekyll academic website structure created successfully!"
echo ""
echo "Next steps:"
echo "1. Edit _config.yml with your personal information"
echo "2. Replace the placeholder content with your own"
echo "3. Add your profile photo to assets/images/profile.jpg"
echo "4. Initialize a Git repository and push to GitHub:"
echo ""
echo "   git init"
echo "   git add ."
echo "   git commit -m \"Initial website setup\""
echo "   git branch -M main"
echo "   git remote add origin https://github.com/your-username/your-username.github.io.git"
echo "   git push -u origin main"
echo ""
echo "5. Set up GitHub Pages in your repository settings"
echo ""
echo "To create new blog posts, use the script:"
echo "   ./scripts/new_post.sh \"Your Post Title\""
echo ""
echo "To run the site locally:"
echo "   bundle install"
echo "   bundle exec jekyll serve"
echo ""
echo "Happy blogging!"
