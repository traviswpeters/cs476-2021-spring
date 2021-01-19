# Website Helper Makefile
# -> a bunch of phony targets to help me do things I do a lot...

SCHOOL=msu
CLASS=cs476
YEAR=2021
SEMESTER=spring
LOCALSERVERPORT=4400
LIVERELOADSERVERPORT=35400
WEBSITE = $(HOME)/projects/class/$(SCHOOL)-$(CLASS)-$(YEAR)-$(SEMESTER)
CODE = $(HOME)/projects/class/$(SCHOOL)-$(CLASS)-code

ADMIN = $(HOME)/Desktop/msu/teaching/class/$(CLASS)/$(YEAR)
ADMINREPO = $(HOME)/projects/class/admin-teaching/

.PHONY: help # Generate list of targets with descriptions
help:
	@echo "Makefile Context:"
	@echo "-----------------"
	@echo " - Website:" $(WEBSITE)
	@echo " - Admin:" $(ADMIN)
	@echo ""
	@echo "Makefile Targets:"
	@echo "-----------------"
	@grep '^.PHONY: .* #' Makefile | sed 's/\.PHONY: \(.*\) # \(.*\)/\1	# \2/' | expand -t10

.PHONY: local # run a local jekyll server
local:
	@jekyll serve --port $(LOCALSERVERPORT) --livereload-port $(LIVERELOADSERVERPORT) &

.PHONY: show # show any running jekyll servers
show:
	@psgrep jekyll

.PHONY: kill # kill all currently running instances of ruby/jekyll
kill:
	-pgrep -f  'jekyll serve' | xargs kill 1>&2 2> /dev/null

.PHONY: slides # fetch exported PDF versions of slides from iCloud and copy to website
slides:
	@echo "Fetching PDF versions of slides w/ prefix '$(CLASS)'..."
	- @mv $(ADMIN)/$(CLASS)-*.pdf $(WEBSITE)/files/ 2> /dev/null
	@echo "\nSlides in 'files/' on website:"
	@ls -alG $(WEBSITE)/files/$(CLASS)*

.PHONY: release # commit slides+links
release:
	# git add .
	git add *.md files/
	git commit -m "Release course updates (slides, links, etc.)"
	git push origin HEAD

######################################
# SEED Helpers

.PHONY: vmstart # -> start the primary SEED VM
vmstart:
	- VBoxManage startvm "SEEDUbuntu20.04" --type headless && ssh seed

.PHONY: vmstop # -> stop the primary SEED VM
vmstop:
	- VBoxManage controlvm "SEEDUbuntu20.04" poweroff

.PHONY: vmrestart # -> restart the primary SEED VM
vmrestart: vmstop vmstart

.PHONY: vmlist # -> see which VMs exist, and which VMs are running
vmlist:
	@echo "Available VMs:"
	@echo "-----------------"
	@VBoxManage list vms
	@echo
	@echo "Running VMs:"
	@echo "-----------------"
	@VBoxManage list runningvms

######################################
# Misc. Helpers
# ~~> You can safely ignore these...

.PHONY: work # -> open course-related slides, admin folders, and code
work:
	-open $(ADMIN)/../.. # iCloud stuff (slides, etc.)
	-open $(ADMINREPO) # admin (solutions, exams, etc.)
	-open $(CODE) # public code
	-open $(WEBSITE) # Website

.PHONY: clean # clean up some generated/tmp files
clean:
	rm -rf *~

.PHONY: cleanhard # clean up most stuff...
cleanhard: clean
	rm -rf _site .jekyll_cache
