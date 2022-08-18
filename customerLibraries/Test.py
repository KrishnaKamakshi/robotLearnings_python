from robot.api.deco import *
from robot.libraries.BuiltIn import *


@library
class Test:

    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def demo_world(self):
        a = 5
        b = 6
        c = a + b
        print("hello word", c)

    @keyword
    def items_to_be_added(self, productList):
        i = 1
        productTitle = self.selLib.get_webelements("css:.card-title")
        for listElement in productTitle:
            if listElement.text in productList:
                self.selLib.click_button("xpath:(//*[@class='card-footer'])[" + str(i) + "]/button")
            i = i + 1

    @keyword
    def scroll_the_page_until_all_elements_are_loaded(self):
        last_h = self.selLib.execute_javascript("return document.body.scrollHeight")
        while True:
            self.selLib.execute_javascript("window.scrollTo(0, document.body.scrollHeight);")
            time.sleep(5)
            new_h = self.selLib.execute_javascript("return document.body.scrollHeight")
            if new_h == last_h:
                break
            last_h = new_h
