# This line specifies the base image
FROM arm64v8/alpine

# The RUN instruction specifies commands to be run, and captured into the new container image
RUN apk add curl



# The COPY instruction copies files and directories to the container's file system. The files and directories must be in a path relative to the Dockerfile
COPY 

# The ADD instruction is like the COPY instruction, but with even more capabilities. 
# In addition to copying files from the host into the container image, the ADD instruction can also copy files from a remote location with a URL specification
ADD


# The CMD instruction sets the default command to be run when deploying an instance of the container image
CMD






# copy the xxx.tgz to the tmp directory of the container and extract it
ADD xxx.tgz /tmp


# copy the xxx.tgz to the tmp directory of the container and do not extract it
COPY xxx.tgz /tmp
