NAME	= square
SPEC	= $(NAME).spec
VERSION	= 0.03
LIB	= lib$(NAME)
BIN	= square_app
SCRIPTS	= square_app.pl
SRCS	= $(NAME).c $(NAME).h $(BIN).c
AUX	= $(SPEC) Makefile
DISTDIR	= $(NAME)-$(VERSION)

all:	$(LIB).so $(BIN)

$(BIN):	$(BIN).c $(NAME).o
	gcc -L . -l$(NAME) -Wall -Werror -o $(BIN) $(BIN).c

$(LIB).so:	$(NAME).o
	gcc -shared -o $(LIB).so $(NAME).o

$(NAME).o:	$(NAME).c
	gcc -c -Wall -Werror -fpic $(NAME).c

clean:	
	rm -f $(NAME).o $(LIB).so $(BIN)

dist:	$(SRCS) $(AUX) $(SCRIPTS)
	-rm -rf $(DISTDIR)
	mkdir $(DISTDIR)
	ln $(SRCS) $(AUX) $(SCRIPTS) $(DISTDIR)
	tar chzfv $(DISTDIR).tar.gz $(DISTDIR)
	-rm -rf $(DISTDIR)

$(DISTDIR).tar.gz:	dist

rpm:	$(DISTDIR).tar.gz
	rpmbuild -ta $(DISTDIR).tar.gz
