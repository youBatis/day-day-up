package com.hp.up.core.Entity;

/**
 * Created by haopeng on 2017/9/13  22:11.
 */
public class MailEntity {
    /**
     * 收件人账户
     */
    private String receiverMailAccount;
    /**
     * 邮件主题
     */
    private String topic;
    /**
     * 邮件内容
     */
    private String content;
    /**
     *模板文件名
     */
    private String templateName;

    public MailEntity() {
    }

    public MailEntity(String topic, String content,String receiverMailAccount) {
        this.topic = topic;
        this.content = content;
        this.receiverMailAccount = receiverMailAccount;
    }

    public MailEntity(String topic, String content,String receiverMailAccount,String templateName) {
        this.topic = topic;
        this.content = content;
        this.receiverMailAccount = receiverMailAccount;
        this.templateName = templateName;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getReceiverMailAccount() {
        return receiverMailAccount;
    }

    public void setReceiverMailAccount(String receiverMailAccount) {
        this.receiverMailAccount = receiverMailAccount;
    }

    public String getTemplateName() {
        return templateName;
    }

    public void setTemplateName(String templateName) {
        this.templateName = templateName;
    }

    @Override
    public String toString() {
        return "MailEntity{" +
                "receiverMailAccount='" + receiverMailAccount + '\'' +
                ", topic='" + topic + '\'' +
                ", content='" + content + '\'' +
                ", templateName='" + templateName + '\'' +
                '}';
    }
}
