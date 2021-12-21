.PHONY: clean All Project_Title Project_Build

All: Project_Title Project_Build

Project_Title:
	@echo "----------Building project:[ rf - BuildSet ]----------"

Project_Build:
	@make -r -f rf.mk -C  ./ 


clean:
	@echo "----------Cleaning project:[ rf - BuildSet ]----------"

