document.addEventListener('DOMContentLoaded', function () {
    const postForm = document.getElementById('post-form');
    const postsContainer = document.getElementById('posts');

    postForm.addEventListener('submit', function (e) {
        e.preventDefault();

        const imageFile = document.getElementById('image').files[0];
        const postText = document.getElementById('post-text').value;

        if (imageFile && postText) {
            // Vytvo�en� nov�ho postu
            const post = document.createElement('div');
            post.className = 'post';
            const image = document.createElement('img');
            image.src = URL.createObjectURL(imageFile);
            image.alt = 'Obr�zek';
            const text = document.createElement('p');
            text.textContent = postText;

            post.appendChild(image);
            post.appendChild(text);
            postsContainer.appendChild(post);

            // Vy�i�t�n� formul��e
            document.getElementById('image').value = '';
            document.getElementById('post-text').value = '';
        }
    });
});
