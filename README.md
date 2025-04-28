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
