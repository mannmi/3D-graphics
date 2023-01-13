#ifndef PLAYGROUND_H
#define PLAYGROUND_H

// Include GLEW
#include <GL/glew.h>
#include "glm/detail/type_mat.hpp"

//some global variables for handling the vertex buffer
GLuint vertexbuffer;
GLuint VertexArrayID;
GLuint VAO_id, VBO_id, EBO_id;
GLuint vertexbuffer_size;
const void *g_vertex_buffer_data;


float deg = 0;
float deg2 = 0;

//program ID of the shaders, required for handling the shaders with OpenGL
GLuint programID;


int main(void); //<<< main function, called at startup
void updateAnimationLoop(); //<<< updates the animation loop
bool initializeWindow(); //<<< initializes the window using GLFW and GLEW
bool initializeVertexbuffer(); //<<< initializes the vertex buffer array and binds it OpenGL
bool cleanupVertexbuffer(); //<<< frees all recources from the vertex buffer
bool closeWindow(); //<<< Closes the OpenGL window and terminates GLFW

void drawFBXModel();

GLuint VAO, VBO, EBO;


GLuint vertexBuffer;
GLuint normalBuffer;
GLuint textureBuffer;
GLuint indexBuffer;
GLuint texture;
GLuint textureID;


#endif

