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

.PHONY: start # run a local jekyll server
start:
	@jekyll serve --port $(LOCALSERVERPORT) --livereload-port $(LIVERELOADSERVERPORT) &

.PHONY: stop # stop (kill) any/all currently running instances of ruby/jekyll
stop:
	-pgrep -f  'jekyll serve' | xargs kill 1>&2 2> /dev/null

.PHONY: show # show any running jekyll servers
show:
	@psgrep jekyll

.PHONY: convert # convert a LaTeX file to Markdown --> make convert infile=example.tex outfile=example.md
convert:
	# NOTE: Too awkward to do this automatically - we have to clean-up the files quite a bit before publishing...
	#       For now, use the commands/comments below for reference.
	#
	# @pandoc -s $(infile) -o $(outfile)
	#
	# cd ~/projects/class/seed-labs/category-software/Environment_Variable_and_SetUID/ && pandoc -s Environment_Variable_and_SetUID.tex -o $(WEBSITE)/labs/lab01.md
	# cd ~/projects/class/seed-labs/category-software/Shellshock/                      && pandoc -s Shellshock.tex                      -o $(WEBSITE)/labs/lab02.md
	# cd ~/projects/class/seed-labs/category-software/Buffer_Overflow_Setuid/          && pandoc -s Buffer_Overflow_Setuid.tex          -o $(WEBSITE)/labs/lab03.md
	#
	# cd ~/projects/class/seed-labs/category-web/ && pandoc -s TEXFILE -o $(WEBSITE)/labs/lab04.md
	# cd ~/projects/class/seed-labs/category-web/ && pandoc -s TEXFILE -o $(WEBSITE)/labs/lab05.md
	# cd ~/projects/class/seed-labs/category-web/ && pandoc -s TEXFILE -o $(WEBSITE)/labs/lab06.md
	#
	# cd ~/projects/class/seed-labs/category-crypto/ && pandoc -s TEXFILE -o $(WEBSITE)/labs/lab07.md
	# cd ~/projects/class/seed-labs/category-crypto/ && pandoc -s TEXFILE -o $(WEBSITE)/labs/lab08.md
	# cd ~/projects/class/seed-labs/category-crypto/ && pandoc -s TEXFILE -o $(WEBSITE)/labs/lab09.md
	#

.PHONY: slides # fetch exported PDF versions of slides from iCloud and copy to website
slides:
	@echo "Fetching PDF versions of slides w/ prefix '$(CLASS)'..."
	-@mv $(ADMIN)/$(CLASS)-*.pdf $(WEBSITE)/files/ 2> /dev/null
	@echo "\nSlides in 'files/' on website:"
	@ls -alG $(WEBSITE)/files/$(CLASS)*
	@open $(WEBSITE)/files/

.PHONY: release # commit slides+links
release:
	# git add .
	git add index.md files/ #*.md
	git commit -m "Release course updates (slides, links, etc.)"
	git push origin HEAD

######################################
# SEED Helpers
VMNAME=SEEDUbuntu20.04

# SHARED FOLDER SETUP
# -------------------
# 1. Need to add $USER to vboxsf group so that it can access shared folders.
#   $ sudo usermod -aG vboxsf $USER
# 2. Reboot the VM and log back in.
# 3. Shared folders should be added/removed on start/stop (similar to how vagrant does it)

.PHONY: vmstart # -> start the primary SEED VM
vmstart:
	-VBoxManage sharedfolder add $(VMNAME) --name "shared_admin" --hostpath "/Users/twp/projects/class/admin" --automount --auto-mount-point "/home/seed/shared_admin"
	-VBoxManage sharedfolder add $(VMNAME) --name "shared_code" --hostpath "/Users/twp/projects/class/msu-cs476-code" --automount --auto-mount-point "/home/seed/shared_code"
	-VBoxManage sharedfolder add $(VMNAME) --name "shared_website" --hostpath "/Users/twp/projects/class/msu-cs476-2021-spring" --automount --auto-mount-point "/home/seed/shared_website"
	-VBoxManage startvm $(VMNAME) --type headless && ssh seed

.PHONY: vmstop # -> stop the primary SEED VM
vmstop:
	-VBoxManage controlvm $(VMNAME) poweroff
	-VBoxManage sharedfolder remove $(VMNAME) --name "shared_website"
	-VBoxManage sharedfolder remove $(VMNAME) --name "shared_code"
	-VBoxManage sharedfolder remove $(VMNAME) --name "shared_admin"

.PHONY: vmrestart # -> restart the primary SEED VM
vmrestart: vmstop vmstart

.PHONY: vmlist # -> see which VMs exist, and which VMs are running
vmlist:
	@echo "Available VMs:"
	@echo "-----------------"
	@VBoxManage list vms | sed 's/"*"/,/g' | column -s ',' -t
	@echo
	@echo "Running VMs:"
	@echo "-----------------"
	@VBoxManage list runningvms  | sed 's/"*"/,/g' | column -s ',' -t

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
