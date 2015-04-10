package by.ulezla.utils.view;

import java.util.ArrayList;
import java.util.List;

public class HTreeItem {
    private String text;
    private String type;
    private List<HTreeItem> children;

    public HTreeItem(String text, String type) {
        this.text = text;
        this.type = type;
        children = new ArrayList<>();
    }

    public String getText() {
        return text;
    }

    public void addChild(HTreeItem hTreeItem) {
        children.add(hTreeItem);
    }

}
