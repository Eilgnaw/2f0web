# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Jekyll-based static site using the Quattle theme (version 1.6.0). The site is a Chinese blog called "记忆碎片" (Memory Fragments) hosted at https://2f0.cn, focused on technical content including Xcode, iOS development, and system administration.

## Development Commands

### Local Development
```bash
# Install dependencies
bundle install

# Serve the site locally with live reload
bundle exec jekyll serve

# Build the site for production
bundle exec jekyll build

# Serve with drafts included
bundle exec jekyll serve --drafts
```

### Common Jekyll Commands
```bash
# Create a new post
bundle exec jekyll post "Post Title"

# Check for build issues
bundle exec jekyll doctor

# Clean generated files
bundle exec jekyll clean
```

## Architecture

### Site Structure
- `_config.yml` - Main Jekyll configuration with Chinese locale settings
- `_layouts/` - HTML templates (default, post, page, compress)
- `_includes/` - Reusable HTML components (author.html, cookie-consent.html)
- `_posts/` - Blog posts in Markdown format with Chinese content
- `_sass/` - SCSS stylesheets with light/dark theme variables
- `_site/` - Generated static site (auto-generated, excluded from git)
- `assets/` - Static assets (images, icons)

### Theme System
- Based on Quattle theme with customizations for Chinese content
- Supports light/dark mode via CSS `prefers-color-scheme`
- Color schemes defined in `_sass/_variables.scss`
- Responsive design with mobile-first approach

### Content Management
- Posts are in `_posts/` directory with YAML frontmatter
- Categories: Xcode, iOS development, system administration
- Tags system for content organization
- Chinese language content with timezone set to Asia/Shanghai
- Pagination enabled (1 post per page as configured)

### Key Configurations
- Site timezone: Asia/Shanghai
- Permalink structure: `:title/`
- Kramdown footnote backlink: "&#10548;"
- SASS compression enabled
- Jekyll plugins: gist, paginate, seo-tag, target-blank

## Important Notes

- This is a Chinese language blog, maintain Chinese content when creating posts
- The site uses traditional Chinese navigation: 文章 (Articles), 分类 (Categories), 关于 (About)
- Author information configured for "Eilgnaw" with email mail@eilganw.com
- ICP license number: 豫ICP备2023000628号-1 (included in footer)
- Google Analytics support available but currently disabled
- **CRITICAL**: Avoid Chinese comments in JavaScript code - they can cause parsing errors and break functionality. Use English comments only in JS files.