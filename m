Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B936507B75
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Apr 2022 22:57:29 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F208F402FC
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Apr 2022 20:57:27 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	by lists.linaro.org (Postfix) with ESMTPS id BBC583EC3E
	for <greybus-dev@lists.linaro.org>; Mon, 11 Apr 2022 21:14:16 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id c1so4996309qke.10
        for <greybus-dev@lists.linaro.org>; Mon, 11 Apr 2022 14:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=pkqd/GLpbqG7LAJ4m2LQWbg8yZe6P+EQh4+ijIpHwnY=;
        b=OO+sNYffcThi1xuROkKjBvJC05pcnrdx9WCnKGlHC58OIFg0RJeLekSfy1X5KM4QNk
         bjwKEyighYrUdxNUKxrkvNYNYWPxxatIbz2q+L40irGMA0JDZMD/Ixs04jHpp+vhPOKv
         QI2RRomlpipb3L+lAycz6Op2Ql1UfTXHVjLfzN23LO7fD+CpaHgUb6YBg46eFtTm4MnU
         MgJn8UytsHLcKOoUK7Ia5lonrpbyMk68bk49IYduea0dMG8D6dQsJvbUOF7q18bVdbMA
         w4/tjBahZ9KkqYX1lY7BibX+7ZwN1IKzuJc6zfhXrGVMlmCUFNrSfNOePO2382E0ryll
         FNIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=pkqd/GLpbqG7LAJ4m2LQWbg8yZe6P+EQh4+ijIpHwnY=;
        b=Y4tBJGcU+CKzEJTyq/sEaHl1qzWn75DQi+1trquJA0WDvH/mmiSYc9JOAZf14PGU4J
         5ubPVpe2eo/yNWDIwSzf9tCuFq0jafJRBMBgZaqtchEScwc/j3I0GvmYM/S5cfREGi5i
         cfqSBTaG3MN3azcL0sVkgIf/5sTCn5Q0H5qSpdYT5Omk7+GHgazHQTYgdzknd1lVcDn8
         1W/rLU6b0gNiRVJ61Wk7hNTfLNhjcXvMDgNvQe8O98iXfaVlNY4pTjSJtNN91TFS8CJn
         wjTTLlNIv4ij93bCKvS8pUbBY4Tu6n4UQRgBE3tHELemTGXumE9vmFnKtwFSyJ5v/sdw
         ybLA==
X-Gm-Message-State: AOAM531XM50B82D7vQHW/0tenpKaRM/l6SqKZsLkDsfbiKXk58qe97uN
	IcEIpKNzrsGpLxHnOnWdKyE=
X-Google-Smtp-Source: ABdhPJyn7F36KNFwMXSCnqIDUv0dsKQ0NTeXHJoevaRzT0RVRooVRLQYT1yzOqDcZvA56oJwefUpdg==
X-Received: by 2002:a05:620a:1a99:b0:680:f33c:dbd3 with SMTP id bl25-20020a05620a1a9900b00680f33cdbd3mr970653qkb.17.1649711656365;
        Mon, 11 Apr 2022 14:14:16 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id c134-20020ae9ed8c000000b0069bf8f9cfb2sm5123158qkg.118.2022.04.11.14.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 14:14:15 -0700 (PDT)
Date: Mon, 11 Apr 2022 17:14:11 -0400
From: Jaehee Park <jhpark1013@gmail.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev,
	Jaehee Park <jhpark1013@gmail.com>
Message-ID: <20220411211411.GA2796005@jaehee-ThinkPad-X1-Extreme>
MIME-Version: 1.0
Content-Disposition: inline
X-MailFrom: jhpark1013@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: KKRTRN6SBMQRT54DF2OGC3AX23UH5PYV
X-Message-ID-Hash: KKRTRN6SBMQRT54DF2OGC3AX23UH5PYV
X-Mailman-Approved-At: Tue, 19 Apr 2022 20:57:24 +0000
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: replace zero-element array with flexible-array
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KKRTRN6SBMQRT54DF2OGC3AX23UH5PYV/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Zero-length and one-element arrays are deprecated. Flexible-array
members should be used instead. Flexible-array members are
recommended because this is the way the kernel expects dynamically
sized trailing elements to be declared.
Refer to Documentation/process/deprecated.rst.

Change the zero-length array, buf, in the struct 
gb_usb_hub_control_response to a flexible array. And add wLength as a 
member of the struct so that the struct is not a zero-sized struct.

Issue found by flexible_array coccinelle script.

Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
---

I have a question for the authors: 
I saw a fixme comment in the hub_control function in usb.c:
/ FIXME: handle unspecified lengths /

I was wondering why this comment was left there?

In this patch, I'm using this struct:

struct gb_usb_hub_control_response {
    __le16 wLength;
    u8 buf[];
};

And instead of using response_size, I'm doing this:

struct gb_usb_hub_control_response *response;
And using sizeof(*response) as the input to gb_operation_create.

Would the flexible array address the handling of unspecified lengths 
issue (in the fixme comment)?


 drivers/staging/greybus/usb.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/usb.c b/drivers/staging/greybus/usb.c
index 8e9d9d59a357..d0b2422401df 100644
--- a/drivers/staging/greybus/usb.c
+++ b/drivers/staging/greybus/usb.c
@@ -27,7 +27,8 @@ struct gb_usb_hub_control_request {
 };
 
 struct gb_usb_hub_control_response {
-	u8 buf[0];
+	__le16 wLength;
+	u8 buf[];
 };
 
 struct gb_usb_device {
@@ -102,16 +103,14 @@ static int hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue, u16 wIndex,
 	struct gb_operation *operation;
 	struct gb_usb_hub_control_request *request;
 	struct gb_usb_hub_control_response *response;
-	size_t response_size;
 	int ret;
 
 	/* FIXME: handle unspecified lengths */
-	response_size = sizeof(*response) + wLength;
 
 	operation = gb_operation_create(dev->connection,
 					GB_USB_TYPE_HUB_CONTROL,
 					sizeof(*request),
-					response_size,
+					sizeof(*response),
 					GFP_KERNEL);
 	if (!operation)
 		return -ENOMEM;
-- 
2.25.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
