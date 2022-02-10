Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7A54CA936
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Mar 2022 16:37:57 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 218AA3EF45
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Mar 2022 15:37:57 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	by lists.linaro.org (Postfix) with ESMTPS id BF0AA3E887
	for <greybus-dev@lists.linaro.org>; Thu, 10 Feb 2022 06:02:13 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id x5so4101037qtw.10
        for <greybus-dev@lists.linaro.org>; Wed, 09 Feb 2022 22:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XKrz6bApi0/dsmE95e4g0zGa9CuMMOhYtsPE3YuMXWE=;
        b=hQw2cIl4ZF4Usav+Wpu99AIfOMknmyChe7N4wleG0Aqh84i0EYKXwuPtxfprUWsYro
         hwrHjwskZM9feaFA9SQatg8ZnR5P28T83p4u9EJ5AjCcAq6GdGsyS5v3J/gazY1Nhr3M
         4maSe8esqQGnkPir68BRJ0qCNDBKkF1Hu64pyUgT5hjQ07vPp4GNv4kekFM9kiVuUJgm
         qjbZllq/DvUx79jgGssoHGVzOWKOJDTOgu/So2qLGky7Cir2ogq/3oG98uKEJIQBjm4m
         BKcIBRmToGjo/HI7f7Uq+VJrjLfXCfspfcDpxCcc1cxKmUj/DcF7VIcqrCJTw+4nu7K0
         zeDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XKrz6bApi0/dsmE95e4g0zGa9CuMMOhYtsPE3YuMXWE=;
        b=7WIxAtf4p0jj5GxTiYGTzMh5TkO9BhutD6NOdvaty3XChiR9skJf9Iv+Ft8/c4P9sC
         rl9yG22f1dkXQ+8mEbDlpqKe8IKAvezvLSIDIuyS0Ap0MDbwxpaQkyvEolvd30KMcEFj
         dUi7Jjw8r7qXokGKO/0AptTvbT1wFZVjWRB2qV+o8X9ebiKlMlun4C07K0wjwFneDfNN
         LUEpEMRTWpca5d0rKf2ACuWPZzhJLgvsZxu6ndGKvXy38BoGIGDZ1FKVc9plUqQdhjrN
         YCR59eLboeRmfLtCENlJXk8pawohHpotz6JlWaQhOhTwlLML0b+i8MzUHxraBEC2/fcq
         sJdQ==
X-Gm-Message-State: AOAM531jY8lWdknnl0lXjxdjN+ZwqZwjBtL9sTxILKi/hDdxtcNcOUao
	g/mmj1O6MLDlxUrs7RcZgYlvAsdxoz8=
X-Google-Smtp-Source: ABdhPJwsJcp4q7PEnSA447KhyLtwRARtizksuTwP1Dav6tE4wkPVKCyLIGMnuqsMHDXS0p0l8STZrQ==
X-Received: by 2002:a05:622a:64e:: with SMTP id a14mr3689197qtb.212.1644472933488;
        Wed, 09 Feb 2022 22:02:13 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id h9sm10009584qkn.121.2022.02.09.22.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 22:02:12 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: rmfrfs@gmail.com
Date: Thu, 10 Feb 2022 06:02:05 +0000
Message-Id: <20220210060205.1607792-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MailFrom: cgel.zte@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: YYX73AFENQIB3OYJD2N7RZUGINRXGRA4
X-Message-ID-Hash: YYX73AFENQIB3OYJD2N7RZUGINRXGRA4
X-Mailman-Approved-At: Wed, 02 Mar 2022 15:37:54 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Minghao Chi <chi.minghao@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: Remove redundant 'flush_workqueue()' calls
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YYX73AFENQIB3OYJD2N7RZUGINRXGRA4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Minghao Chi (CGEL ZTE) <chi.minghao@zte.com.cn>

'destroy_workqueue()' already drains the queue before destroying it,
so there is no need to flush it explicitly.

Remove the redundant 'flush_workqueue()' calls.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi (CGEL ZTE) <chi.minghao@zte.com.cn>
---
 drivers/staging/greybus/sdio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/greybus/sdio.c b/drivers/staging/greybus/sdio.c
index 37bf04c22dbc..25bee5335c70 100644
--- a/drivers/staging/greybus/sdio.c
+++ b/drivers/staging/greybus/sdio.c
@@ -858,7 +858,6 @@ static void gb_sdio_remove(struct gbphy_device *gbphy_dev)
 	gb_connection_set_data(connection, NULL);
 	mutex_unlock(&host->lock);
 
-	flush_workqueue(host->mrq_workqueue);
 	destroy_workqueue(host->mrq_workqueue);
 	gb_connection_disable_rx(connection);
 	mmc_remove_host(mmc);
-- 
2.25.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
