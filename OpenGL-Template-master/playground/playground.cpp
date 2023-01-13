#include "playground.h"

#include <SOIL/SOIL.h>

#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtx/transform.inl>

// Include standard headers
#include <stdio.h>
#include <stdlib.h>


// Include GLFW
#include <glfw3.h>

GLFWwindow *window;

// Include GLM
#include <glm/glm.hpp>

using namespace glm;

#include <common/shader.hpp>

// Include the Assimp library header files
#include <assimp/Importer.hpp>
#include <assimp/scene.h>
#include <assimp/postprocess.h>
#include <iostream>
#include <vector>


// Create the necessary data structures to store the vertex, texture, and normal information
std::vector<glm::vec3> vertices;
std::vector<float> textures;
std::vector<glm::vec3> normals;
//std::vector<unsigned int> indices;
std::vector<glm::vec3> indices;


Assimp::Importer importer;

const aiScene *scene;
aiMesh *mesh;
aiFace face;

bool meshFunc() {

// Create the vertex array object
    GLuint VAO;
    glGenVertexArrays(1, &VAO);
    glBindVertexArray(VAO);

// Create buffers

    glGenBuffers(1, &vertexBuffer);
    glBindBuffer(GL_ARRAY_BUFFER, vertexBuffer);
    glBufferData(GL_ARRAY_BUFFER, vertices.size() * sizeof(glm::vec3), &vertices[0], GL_STATIC_DRAW);

    glGenBuffers(1, &normalBuffer);
    glBindBuffer(GL_ARRAY_BUFFER, normalBuffer);
    glBufferData(GL_ARRAY_BUFFER, normals.size() * sizeof(glm::vec3), &normals[0], GL_STATIC_DRAW);

    glGenBuffers(1, &textureBuffer);
    glBindBuffer(GL_ARRAY_BUFFER, textureBuffer);
    glBufferData(GL_ARRAY_BUFFER, textures.size() * sizeof(glm::vec2), &textures[0], GL_STATIC_DRAW);

    glGenBuffers(1, &indexBuffer);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, indexBuffer);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, indices.size() * sizeof(unsigned int), &indices[0], GL_STATIC_DRAW);

    return true;
}


// Function to load an FBX file using Assimp
void loadFBXFile(const char *path) {
    Assimp::Importer importer;
    scene = importer.ReadFile(path, aiProcess_Triangulate | aiProcess_FlipUVs);
    if (!scene || scene->mFlags & AI_SCENE_FLAGS_INCOMPLETE || !scene->mRootNode) {
        std::cerr << "ERROR::ASSIMP::" << importer.GetErrorString() << std::endl;
        return;
    }

    // Iterate through the meshes in the scene
    for (unsigned int i = 0; i < scene->mNumMeshes; i++) {
        mesh = scene->mMeshes[i];

        // Iterate through the vertices in the mesh
        for (unsigned int j = 0; j < mesh->mNumVertices; j++) {
            // Add the vertex coordinates to the vertices vector
            vertices.emplace_back(mesh->mVertices[j].x, mesh->mVertices[j].y, mesh->mVertices[j].z);
            if (mesh->mTextureCoords[0]) {
                textures.push_back(mesh->mTextureCoords[0][j].x);
                textures.push_back(mesh->mTextureCoords[0][j].y);
            } else {
                //todo later
                //glm::vec2(0.0f,0.0f);
            }
            // Add the normal coordinates to the normals vector
            normals.emplace_back(mesh->mNormals[j].x, mesh->mNormals[j].y, mesh->mNormals[j].z);
        }
        // iteration through mesh's faces (a face is a mesh its triangle) and retrieve the corresponding vertex indices.
        for (unsigned int i = 0; i < mesh->mNumFaces; i++) {
            face = mesh->mFaces[i];
            // Retrieve all indices of the face and store them in the indices vector
            for (unsigned int j = 0; j < face.mNumIndices; j++) {
                indices.emplace_back(face.mIndices[j]);
            }
        }
    }

    std::cout << "Done with the loadFBXFile" << std::endl;
}

bool loadTexture(const char *path) {
    // Load the texture file into memory
    int width, height;

    // Load the image data from the PNG file
    unsigned char *image = SOIL_load_image(path, &width, &height, 0, SOIL_LOAD_RGB);

    // Generate the texture object
    glGenTextures(1, &textureID);

    // Bind the texture to the active texture unit
    glActiveTexture(GL_TEXTURE0);
    glBindTexture(GL_TEXTURE_2D, textureID);

    // Load the texture image data
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, width, height, 0, GL_RGB, GL_UNSIGNED_BYTE, image);

    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);

    // Unload the image data
    SOIL_free_image_data(image);
}

int main(void) {
    //Initialize window
    bool windowInitialized = initializeWindow();
    if (!windowInitialized) return -1;
    loadFBXFile("./uno_reverse_card_4129206(1)/files/uno_reverse_model1.stl");

    //Initialize vertex buffer
    bool vertexbufferInitialized = meshFunc();
    if (!vertexbufferInitialized) return -1;

    // Create and compile our GLSL program from the shaders
    programID = LoadShaders("SimpleVertexShader.vertexshader", "SimpleFragmentShader.fragmentshader");


    // Enable depth test
    glEnable(GL_DEPTH_TEST);
    glDepthFunc(GL_LESS);
    //start animation loop until escape key is pressed
    do {
        updateAnimationLoop();

    } // Check if the ESC key was pressed or the window was closed
    while (glfwGetKey(window, GLFW_KEY_ESCAPE) != GLFW_PRESS &&
           glfwWindowShouldClose(window) == 0);


    //Cleanup and close window
    cleanupVertexbuffer();
    glDeleteProgram(programID);
    closeWindow();

    return 0;
}

void updateAnimationLoop() {

    // Clear the screen
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    // Use our shader
    glUseProgram(programID);

    static double xpos, ypos;
    glfwGetCursorPos(window, &xpos, &ypos);
    std::cout << "xpos  " << xpos << "ypos " << ypos << std::endl;


    // Check if mouse is clicked
    int left_mouse_clicked = glfwGetMouseButton(window, GLFW_MOUSE_BUTTON_LEFT);

    // Move the object if left mouse is clicked
    if (left_mouse_clicked == GLFW_PRESS) {
        deg = xpos;
        deg2 = ypos;
        // Use the transformation matrix to move the object
    }


    //build rotation matrix 1
    glm::vec3 myRotationAxis(0.0f, 1.0f, 0.0f);
    glm::mat4 myR = glm::rotate(radians(deg), myRotationAxis);

    //build rotation matrix 2
    glm::vec3 myRotationAxis2(1.0f, 0.0f, 0.0f);
    glm::mat4 myR2 = glm::rotate(radians(deg2), myRotationAxis2);

    //translation matrix
    glm::mat4 myT = glm::translate(glm::mat4(), glm::vec3(0.0f, 0.0f, 0.0f));

    glm::mat4 Projection = glm::perspective(glm::radians(65.0f), 1024.0f / 1024.0f, 0.1f, 1000.0f);

    // Camera matrix
    glm::mat4 View = glm::lookAt(
            glm::vec3(0, 3, 10), // Camera is at (0,3,220)
            glm::vec3(0, 0, 0), // and looks at the origin
            glm::vec3(0, 1, 0)
    );

    // Model matrix : an identity matrix (model will be at the origin)
    glm::mat4 Model = glm::mat4(1.0f);
    //apply rotation and translation
    Model = myT * myR * myR2 * Model;
    // My ModelViewProjection-Matrix
    glm::mat4 mvp = Projection * View * Model;

    GLuint MVPID = glGetUniformLocation(programID, "MVP");
    glUniformMatrix4fv(MVPID, 1, GL_FALSE, &mvp[0][0]);
    GLuint MID = glGetUniformLocation(programID, "M");
    glUniformMatrix4fv(MID, 1, GL_FALSE, &Model[0][0]);
    GLuint VID = glGetUniformLocation(programID, "V");
    glUniformMatrix4fv(VID, 1, GL_FALSE, &View[0][0]);
    glUniform1i(glGetUniformLocation(programID, "myTextureSampler"), 0);

    // Set the vertex attribute pointers
    glBindBuffer(GL_ARRAY_BUFFER, vertexBuffer);
    glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 3 * sizeof(float), (void *) 0);
    glEnableVertexAttribArray(0);
    glBindBuffer(GL_ARRAY_BUFFER, normalBuffer);
    glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE, 3 * sizeof(float), (void *) 0);
    glEnableVertexAttribArray(1);
    glBindBuffer(GL_ARRAY_BUFFER, textureBuffer);
    glVertexAttribPointer(2, 2, GL_FLOAT, GL_FALSE, 2 * sizeof(float), (void *) 0);
    glEnableVertexAttribArray(2);

    int tex_loc = glGetUniformLocation(programID, "basic_texture");
    glTexBuffer(GL_TEXTURE_BUFFER, GL_RGB32F, texture);
    glUniform1i(tex_loc, 0);

    // Draw the triangle !
    glDrawArrays(GL_TRIANGLES, 0, (indices.size() / 3) * 9); // 3 indices starting at 0 -> 1 triangle

    glDisableVertexAttribArray(0);

    // Swap buffers
    glfwSwapBuffers(window);
    glfwPollEvents();
}

bool initializeWindow() {
    // Initialise GLFW
    if (!glfwInit()) {
        fprintf(stderr, "Failed to initialize GLFW\n");
        getchar();
        return false;
    }

    glfwWindowHint(GLFW_SAMPLES, 4);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
    glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE); // To make MacOS happy; should not be needed
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);

    // Open a window and create its OpenGL context
    window = glfwCreateWindow(1024, 1024, "Object Loader Supports Mulible types such as stl fbx etc", NULL, NULL);
    if (window == NULL) {
        fprintf(stderr,
                "Failed to open GLFW window. If you have an Intel GPU, they are not 3.3 compatible. Try the 2.1 version of the tutorials.\n");
        getchar();
        glfwTerminate();
        return false;
    }
    glfwMakeContextCurrent(window);

    // Initialize GLEW
    glewExperimental = true; // Needed for core profile
    if (glewInit() != GLEW_OK) {
        fprintf(stderr, "Failed to initialize GLEW\n");
        getchar();
        glfwTerminate();
        return false;
    }

    // Ensure we can capture the escape key being pressed below
    glfwSetInputMode(window, GLFW_STICKY_KEYS, GL_TRUE);

    // Dark blue background
    glClearColor(0.0f, 0.0f, 0.4f, 0.0f);
    return true;
}

bool cleanupVertexbuffer() {
    // Cleanup VBO
    glDeleteBuffers(1, &vertexbuffer);
    glDeleteVertexArrays(1, &VertexArrayID);
    glDeleteBuffers(1, &VBO);
    glDeleteVertexArrays(1, &VBO_id);
    glDeleteBuffers(1, &VAO);
    glDeleteVertexArrays(1, &VAO_id);
    glDeleteBuffers(1, &EBO);
    glDeleteVertexArrays(1, &EBO_id);
    return true;
}

void drawFBXModel() {
    // Bind the vertex array object
    glBindVertexArray(VAO);

    // Bind the vertex buffer object
    glBindBuffer(GL_ARRAY_BUFFER, VBO);
    glBufferData(GL_ARRAY_BUFFER, vertices.size() * sizeof(float), &vertices[0], GL_STATIC_DRAW);

    // Set the vertex attributes
    glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 3 * sizeof(float), (void *) 0);
    glEnableVertexAttribArray(0);

    // Bind the element buffer object
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, EBO);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, indices.size() * sizeof(unsigned int), &indices[0], GL_STATIC_DRAW);

    // Draw the model
    glDrawElements(GL_TRIANGLES, indices.size(), GL_UNSIGNED_INT, 0);

    glBindVertexArray(0);
    glDeleteVertexArrays(1, &VAO);
    glDeleteBuffers(1, &VBO);
}

bool closeWindow() {
    glfwTerminate();
    return true;
}