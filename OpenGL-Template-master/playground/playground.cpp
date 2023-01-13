#include "playground.h"

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
std::vector<float> vertices;
std::vector<float> textures;
std::vector<float> normals;
std::vector<unsigned int> indices;

Assimp::Importer importer;

const aiScene *scene;
aiMesh *mesh;
aiFace face;

// Create the OpenGL primitives and draw the FBX model
void drawFBXModel() {
    glGenVertexArrays(1, &VAO);
    glGenBuffers(1, &VBO);

    // Bind the vertex array object
    glBindVertexArray(VAO);

    // Bind the vertex buffer object
    glBindBuffer(GL_ARRAY_BUFFER, VBO);
    glBufferData(GL_ARRAY_BUFFER, vertices.size() * sizeof(float), &vertices[0], GL_STATIC_DRAW);

    // Set the vertex attributes
    glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 3 * sizeof(float), (void *) 0);
    glEnableVertexAttribArray(0);

    // Draw the model
    glDrawArrays(GL_TRIANGLES, 0, vertices.size());

    glBindVertexArray(0);
    glDeleteVertexArrays(1, &VAO);
    glDeleteBuffers(1, &VBO);

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
            vertices.push_back(mesh->mVertices[j].x);
            vertices.push_back(mesh->mVertices[j].y);
            vertices.push_back(mesh->mVertices[j].z);
            // Add the texture coordinates to the textures vector
            if (mesh->mTextureCoords[0]) {
                textures.push_back(mesh->mTextureCoords[0][j].x);
                textures.push_back(mesh->mTextureCoords[0][j].y);
            } else {
                //todo later
                //glm::vec2(0.0f,0.0f);
            }
            // Add the normal coordinates to the normals vector
            normals.push_back(mesh->mNormals[j].x);
            normals.push_back(mesh->mNormals[j].y);
            normals.push_back(mesh->mNormals[j].z);


        }
        // Now wak through each of the mesh's faces (a face is a mesh its triangle) and retrieve the corresponding vertex indices.
        for (unsigned int i = 0; i < mesh->mNumFaces; i++) {
            face = mesh->mFaces[i];
            // Retrieve all indices of the face and store them in the indices vector
            for (unsigned int j = 0; j < face.mNumIndices; j++) {
                indices.push_back(face.mIndices[j]);
            }
        }
    }

    // Create the OpenGL primitives and draw the FBX model
    // ...

    // Use the appropriate shader to render the model with the correct lighting and shading
    // ...

    // Add the necessary user interaction to manipulate the model
    // ...
}

int main(void) {
    //Initialize window
    bool windowInitialized = initializeWindow();
    if (!windowInitialized) return -1;

    //Initialize vertex buffer
    bool vertexbufferInitialized = initializeVertexbuffer();
    if (!vertexbufferInitialized) return -1;

    // Create and compile our GLSL program from the shaders
    programID = LoadShaders("SimpleVertexShader.vertexshader", "SimpleFragmentShader.fragmentshader");

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
    glClear(GL_COLOR_BUFFER_BIT);

    // Use our shader
    glUseProgram(programID);

    // 1rst attribute buffer : vertices
    glEnableVertexAttribArray(0);
    glBindBuffer(GL_ARRAY_BUFFER, vertexbuffer);
    glVertexAttribPointer(
            0,                  // attribute 0. No particular reason for 0, but must match the layout in the shader.
            3,  // size
            GL_FLOAT,           // type
            GL_FALSE,           // normalized?
            0,                  // stride
            (void *) 0            // array buffer offset
    );

    // Draw the triangle !
    glDrawArrays(GL_TRIANGLES, 0, vertexbuffer_size); // 3 indices starting at 0 -> 1 triangle

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
    window = glfwCreateWindow(1024, 768, "Tutorial 02 - Red triangle", NULL, NULL);
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

bool initializeVertexbuffer() {
    glGenVertexArrays(1, &VertexArrayID);
    glBindVertexArray(VertexArrayID);


    vertexbuffer_size = sizeof vertices;
    static const GLfloat g_vertex_buffer_data[] = {
            -1.0f, -1.0f, 0.0f,
            1.0f, -1.0f, 0.0f,
            0.0f, 1.0f, 0.0f,
    };

    glGenBuffers(1, &vertexbuffer);
    glBindBuffer(GL_ARRAY_BUFFER, vertexbuffer);
    glBufferData(GL_ARRAY_BUFFER, sizeof(g_vertex_buffer_data), g_vertex_buffer_data, GL_STATIC_DRAW);
*/
    return true;
}

bool cleanupVertexbuffer() {
    // Cleanup VBO
    glDeleteBuffers(1, &vertexbuffer);
    glDeleteVertexArrays(1, &VertexArrayID);
    return true;
}

bool closeWindow() {
    glfwTerminate();
    return true;
}