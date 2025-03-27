- 👋 Hi, I’m @levi07rex
- 👀 I’m interested in ...
- 🌱 I’m currently learning ...
- 💞️ I’m looking to collaborate on ...
- 📫 How to reach me ...
- 😄 Pronouns: ...
- ⚡ Fun fact: ...

<!---
levi07rex/levi07rex is a ✨ special ✨ repository because its `README.md` (this file) appears on your GitHub profile.
You can click the Preview link to take a look at your changes.
--->
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WebGL - Animação de Tomada e Cabo</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js"></script>
    <style>
        body { margin: 0; background-color: black; }
        canvas { display: block; }
    </style>
</head>
<body>

<script>
    // Configuração básica da cena
    const scene = new THREE.Scene();
    const camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
    const renderer = new THREE.WebGLRenderer();

    renderer.setSize(window.innerWidth, window.innerHeight);
    document.body.appendChild(renderer.domElement);

    // Criando um cilindro para representar o cabo
    const cableGeometry = new THREE.CylinderGeometry(0.1, 0.1, 5, 32);
    const cableMaterial = new THREE.MeshBasicMaterial({ color: 0xffff00 });
    const cable = new THREE.Mesh(cableGeometry, cableMaterial);
    cable.rotation.x = Math.PI / 2;
    scene.add(cable);

    // Criando um cubo para representar a tomada
    const socketGeometry = new THREE.BoxGeometry(1, 1, 0.2);
    const socketMaterial = new THREE.MeshBasicMaterial({ color: 0xffffff });
    const socket = new THREE.Mesh(socketGeometry, socketMaterial);
    socket.position.y = -3;
    scene.add(socket);

    // Posicionando a câmera
    camera.position.z = 5;

    // Função de animação
    function animate() {
        requestAnimationFrame(animate);

        // Animação do cabo (efeito de entrada na tomada)
        cable.position.y = Math.sin(Date.now() * 0.002) * 0.5;

        renderer.render(scene, camera);
    }

    animate();

</script>

</body>
</html>
