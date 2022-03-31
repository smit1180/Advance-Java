package ajax;

import java.util.ArrayList;

public class UserIdList {

    private ArrayList<String> userIdList = new ArrayList<>();

    public ArrayList<String> getList() {
        return userIdList;
    }

    public UserIdList() {
        userIdList.add("a@xyz.com");
        userIdList.add("b@xyz.com");
        userIdList.add("c@xyz.com");
        userIdList.add("abc@xyz.com");
        userIdList.add("xyz@xyz.com");
        userIdList.add("def@xyz.com");
    }

    public void addId(String userId) {
        userIdList.add(userId);
    }

    public boolean isPresent(String userId) {
        boolean status = false;
        for (String id : userIdList) {
            if (id.compareTo(userId) == 0) {
                status = true;
                break;
            }
        }
        return status;
    }
}
