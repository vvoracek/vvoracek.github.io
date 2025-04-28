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
