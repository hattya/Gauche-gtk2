;;
;; Simple example, ported from the one in Gtk+2.0 tutorial.
;;
;; $Id: label.scm,v 1.2 2007/01/13 01:36:30 maruska Exp $

(use gtk)

(define (main args)
  (gtk-init args)
  (let1 window (gtk-window-new GTK_WINDOW_TOPLEVEL)
    (g-signal-connect window "destroy" (lambda _ (gtk-main-quit)))
    (gtk-window-set-title window "Label")

    (let1 hbox (gtk-hbox-new #f 5)
      (let1 vbox (gtk-vbox-new #f 5)
        (gtk-container-add window hbox)
        (gtk-box-pack-start hbox vbox #f #f 0)
        (gtk-container-set-border-width window 5)

        (let ((frame (gtk-frame-new "Normal Label"))
              (label (gtk-label-new "This is a Normal label")))
          (gtk-container-add frame label)
          (gtk-box-pack-start vbox frame #f #f 0))

        (let ((frame (gtk-frame-new "Multi-line Label"))
              (label (gtk-label-new "This is a Multi-line label.\nSecond line\nThird line")))
          (gtk-container-add frame label)
          (gtk-box-pack-start vbox frame #f #f 0))

        (let ((frame (gtk-frame-new "Left Justified Label"))
              (label (gtk-label-new "This is a Left-Justified\nMulti-line label.\nThird     line")))
          (gtk-label-set-justify label GTK_JUSTIFY_LEFT)
          (gtk-container-add frame label)
          (gtk-box-pack-start vbox frame #f #f 0))

        (let ((frame (gtk-frame-new "Right Justified Label"))
              (label (gtk-label-new "This is a Right-Justified\nMulti-line label.\nFourth line, (j/k)")))
          (gtk-label-set-justify label GTK_JUSTIFY_RIGHT)
          (gtk-container-add frame label)
          (gtk-box-pack-start vbox frame #f #f 0))
        )
      (let1 vbox (gtk-vbox-new #f 5)
        (gtk-box-pack-start hbox vbox #f #f 0)
        (let ((frame (gtk-frame-new "Line wrapped label"))
              (label (gtk-label-new "This is an example of a line-wrapped label.  It should not be taking up the entire                     width allocated to it, but automatically wraps the words to fit.  The time has come, for all good men, to come to the aid of their party.  The sixth sheik's six sheep's sick.\n     It supports multiple paragraphs correctly, and  correctly  adds many          extra  spaces.  ")))
          (gtk-label-set-line-wrap label #t)
          (gtk-container-add frame label)
          (gtk-box-pack-start vbox frame #f #f 0))
        
        (let ((frame (gtk-frame-new "Filled, wrapped label"))
              (label (gtk-label-new "This is an example of a line-wrapped, filled label.  It should be taking up the entire                   width allocated to it.  Here is a sentence to prove my point.  Here is another sentence.  Here comes the son, do de do de do.\n    This is a new paragraph.\n    This is another newer, longer, better paragraph.  It is coming to an end, unfortunately.")))
          (gtk-label-set-justify label GTK_JUSTIFY_FILL)
          (gtk-label-set-line-wrap label #t)
          (gtk-container-add frame label)
          (gtk-box-pack-start vbox frame #f #f 0))

        (let ((frame (gtk-frame-new "Underlined label"))
              (label (gtk-label-new "This label is underlined!\nThis one is underlined in quite a funky fasion")))
          (gtk-label-set-justify label GTK_JUSTIFY_LEFT)
          (gtk-label-set-pattern label "_________________________ _ _________ _ ______     __ _______ ___")
          (gtk-container-add frame label)
          (gtk-box-pack-start vbox frame #f #f 0))
        )
      )
    (gtk-widget-show-all window)
    )
  (gtk-main)
  0)

      
        