---
layout: page
title: Blog
permalink: /blog/
---

<style>
.clean-container {
  max-width: 900px;
  margin: 0 auto;
}

.blog-header {
  text-align: center;
  margin-bottom: 3rem;
  padding-bottom: 2rem;
  border-bottom: 1px solid #e9ecef;
}

.blog-title {
  font-size: 2.5rem;
  color: #2c3e50;
  margin-bottom: 1rem;
  font-weight: 600;
}

.blog-subtitle {
  font-size: 1.1rem;
  color: #6c757d;
  max-width: 600px;
  margin: 0 auto;
  line-height: 1.6;
}

.post-list-container {
  background: white;
  border-radius: 16px;
  overflow: hidden;
  box-shadow: 0 4px 25px rgba(0,0,0,0.08);
  border: 1px solid #f8f9fa;
}

.post-item {
  padding: 2rem 2.5rem;
  border-bottom: 1px solid #f0f0f0;
  transition: all 0.3s ease;
  position: relative;
  text-decoration: none;
  color: inherit;
  display: block;
}

.post-item:last-child {
  border-bottom: none;
}

.post-item:hover {
  background: #f8f9fa;
  padding-left: 3rem;
  color: inherit;
  text-decoration: none;
}

.post-item::before {
  content: '';
  position: absolute;
  left: 0;
  top: 0;
  bottom: 0;
  width: 4px;
  background: linear-gradient(to bottom, #3498db, #9b59b6);
  transform: scaleY(0);
  transition: transform 0.3s ease;
  transform-origin: bottom;
}

.post-item:hover::before {
  transform: scaleY(1);
}

.post-header {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  margin-bottom: 1rem;
  gap: 1rem;
}

.post-title {
  font-size: 1.4rem;
  font-weight: 600;
  margin: 0;
  color: #2c3e50;
  transition: color 0.3s ease;
  line-height: 1.3;
  flex: 1;
}

.post-item:hover .post-title {
  color: #3498db;
}

.post-date {
  color: #7f8c8d;
  font-size: 0.9rem;
  white-space: nowrap;
  font-weight: 500;
  background: #f8f9fa;
  padding: 0.25rem 0.75rem;
  border-radius: 20px;
  margin-top: 0.25rem;
}

.post-content {
  color: #555;
  font-size: 1rem;
  line-height: 1.7;
  margin: 0;
}

.post-item:hover .post-date {
  background: #e3f2fd;
  color: #1976d2;
}
</style>

<div class="clean-container">
  <div class="blog-header">
    <h1 class="blog-title">Blog</h1>
  </div>

  <div class="post-list-container">
    {% for post in site.posts %}
      <a href="{{ post.url | relative_url }}" class="post-item">
        <div class="post-header">
          <h3 class="post-title">{{ post.title | escape }}</h3>
          <span class="post-date">{{ post.date | date: "%b %-d, %Y" }}</span>
        </div>
        <div class="post-content">{{ post.tldr | default: post.excerpt | strip_html | truncate: 140 }}</div>
      </a>
    {% endfor %}
  </div>
</div>
