Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 1763D6C39CC
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 20:07:08 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2100A3EF88
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 19:07:07 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	by lists.linaro.org (Postfix) with ESMTPS id 6271F3EC46
	for <greybus-dev@lists.linaro.org>; Sun, 19 Mar 2023 11:08:37 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=EWqzApqK;
	spf=pass (lists.linaro.org: domain of eng.mennamahmoud.mm@gmail.com designates 209.85.208.49 as permitted sender) smtp.mailfrom=eng.mennamahmoud.mm@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id b20so3532610edd.1
        for <greybus-dev@lists.linaro.org>; Sun, 19 Mar 2023 04:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679224116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KvKtR1SyAlL8ZclsQUDCqvyh4Wf6MUHzliuNE/yYx4s=;
        b=EWqzApqKGHadxWZtuIft3/9k1Z/U4tnCN8u/aqfrNv6utosGaFw523fJ6leRaqEll4
         EQ28CbfFXGQMNlxErCoLR+Qk5RC/HUMST2x7w6ufa6xR/Xo1z0LJM3VfO/JgBUrCEvso
         FTyn+GRt1ath2vas19mi3uVsa9U11EzxEPdR/ZwUw/WaQaV1mELNtTGWjT4q0euhB9i/
         rC36xSR3eVmaTVjGyeUUfk0Aja3WyroUNB+dVS8kdiMfVjFOkL6GqeN1gef7vJO9Dd2E
         qnCkh9xFyemZ1n+yg03sgw0m633doI8TJyS3h1BdE+4u7pnuI4oRPMKDyEIBe3twjMSf
         yU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679224116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KvKtR1SyAlL8ZclsQUDCqvyh4Wf6MUHzliuNE/yYx4s=;
        b=oeek3fM3JaCEbVWI3GH25dIUHzdWzpgF/gX0IGQ89nW5iM+Ui3OW/yjikW+O+dE2Zf
         4Fk3w1w6on+JmUgYWJUScsZsioo8xz842LrA5U+9Scisb5kJOYjr0QSLEuhz1S7/qXz3
         iWK2HFvhCd6iFd7+3h2edYR2n7sSIpT0WpZK6g1T7NyWEtoKZDweaPrIcc6zb06G0Gyi
         /99NYbzQBTPID4piPJ6wsdbp8RgpvB6AdJUhV9cyHAx67G8Gef2urU7SJ8KYG7koq2BY
         ubnKydfILczwlMjSFQ9ZHqibi0eXI9ZTT6SM6Tj/KA41086WYYVIODMnbNeqOzki19ZH
         BvVw==
X-Gm-Message-State: AO0yUKUgS1jGcgrEZy7pTThIED22sEmN9vYR4dhiQ2zMepgkbi4keGg/
	r/tO5pMRVZdr289NfSgl768=
X-Google-Smtp-Source: AK7set+M2KsLZ2J+fCSTK7GAzj2ZqhFqHG2PxlB63b1Ee3POlZ7DfjOfSQV70skSwAKtdTXkkftrew==
X-Received: by 2002:a17:906:1991:b0:92e:c4c9:7a43 with SMTP id g17-20020a170906199100b0092ec4c97a43mr5679412ejd.25.1679224116271;
        Sun, 19 Mar 2023 04:08:36 -0700 (PDT)
Received: from alaa-emad.. ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id m20-20020a170906259400b0092b8c1f41ebsm3122889ejb.24.2023.03.19.04.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 04:08:35 -0700 (PDT)
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
To: gregkh@linuxfoundation.org
Date: Sun, 19 Mar 2023 13:08:31 +0200
Message-Id: <20230319110831.39931-1-eng.mennamahmoud.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 6271F3EC46
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	FROM_HAS_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.49:from];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,lists.linaro.org,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_NONE(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: eng.mennamahmoud.mm@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: YKVAA67UOFCN2AISU4MH6HFBTCEJYGGI
X-Message-ID-Hash: YKVAA67UOFCN2AISU4MH6HFBTCEJYGGI
X-Mailman-Approved-At: Tue, 21 Mar 2023 19:06:55 +0000
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, eng.mennamahmoud.mm@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: add blank line after struct
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YKVAA67UOFCN2AISU4MH6HFBTCEJYGGI/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

add blank line after struct for readability as
reported by checkpatch script

" CHECK: Please use a blank line after function/struct/union/enum
declarations"

Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
---
 drivers/staging/greybus/gbphy.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/greybus/gbphy.h b/drivers/staging/greybus/gbphy.h
index d4a225b76338..1de510499480 100644
--- a/drivers/staging/greybus/gbphy.h
+++ b/drivers/staging/greybus/gbphy.h
@@ -15,6 +15,7 @@ struct gbphy_device {
 	struct list_head list;
 	struct device dev;
 };
+
 #define to_gbphy_dev(d) container_of(d, struct gbphy_device, dev)
 
 static inline void *gb_gbphy_get_data(struct gbphy_device *gdev)
@@ -43,6 +44,7 @@ struct gbphy_driver {
 
 	struct device_driver driver;
 };
+
 #define to_gbphy_driver(d) container_of(d, struct gbphy_driver, driver)
 
 int gb_gbphy_register_driver(struct gbphy_driver *driver,
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
