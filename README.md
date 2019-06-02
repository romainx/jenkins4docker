# A Jenkins configuration for Docker

## Notes

### Comments in Dockerfile 


> Alternatively, any comment line which includes at least four trailing dashes (-), equal signs (=), or pound signs (#) automatically creates a code section. For example, all of the following lines create code sections:

```R
# Section One ---------------------------------
 
## Section Two =================================
 
### Section Three ############################# 
```
> Note that as illustrated above the line can start with any number of pound signs (#) so long as it ends with four or more -, =, or # characters.

[src](https://support.rstudio.com/hc/en-us/articles/200484568-Code-Folding-and-Sections)


### Pipeline definition

> You cannot execute Pipeline script locally, since its whole purpose is to script Jenkins. (Which is one reason why it is best to keep your Jenkinsfile short and limited to code which actually deals with Jenkins features; your actual build logic should be handled with external processes or build tools which you invoke via a one-line sh or bat step.)

[src](https://stackoverflow.com/questions/36309063/how-can-i-test-a-change-made-to-jenkinsfile-locally)



## Todo

- [ ] Make file -> https://itnext.io/docker-makefile-x-ops-sharing-infra-as-code-parts-ea6fa0d22946