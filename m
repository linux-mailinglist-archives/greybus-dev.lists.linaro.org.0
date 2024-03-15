Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD6987D3EB
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Mar 2024 19:49:53 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EE03F40A53
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Mar 2024 18:49:52 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	by lists.linaro.org (Postfix) with ESMTPS id C311840A53
	for <greybus-dev@lists.linaro.org>; Fri, 15 Mar 2024 18:49:45 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=WUzn6jWw;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.160.42 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-22200c78d4fso1049169fac.1
        for <greybus-dev@lists.linaro.org>; Fri, 15 Mar 2024 11:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710528585; x=1711133385; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0yWXrzwVMKSKKedkMOfXRJscJkRhDPTzhMhPeSYFEA=;
        b=WUzn6jWw+umcGBW66llz0//ze33Q3FNiz61KT/s3MmsKNHw7Kem6Acxfl7lP4hkLEV
         6tFqZC/TwjR9gpwZZm2oyDAza+p5iDOnTPHlQo9OWRtEK3W8IwpLaml+GgXVDudTQfRo
         U66qpV6KF2LnTawEQiJqs2HyvSNjrWXzDJv+6soM5oL8gfUwoYVMf0r1m2nr4+dRCjeQ
         XCgnP18DAEqiboVOcywnnbguLBOa7r334g6jTESgExVuxqiQc38AB+yjUa5UITMgKcJB
         npUWNt7+0/XMTu2ABszM16OF3LkyicWqMvsRkbuA3M/S4hkT+zknKUxGYg9wL25gkR0B
         NTeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710528585; x=1711133385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/0yWXrzwVMKSKKedkMOfXRJscJkRhDPTzhMhPeSYFEA=;
        b=k3aWXopy0wYAozZuhHjPHzxgNlkaXKlL8L8Qi+rrTeaSxAobdhRIJ4XsBUHK42ggaw
         S2vyeLrQZlzq582mcn87yD0RnRxFTCGGOEtkAGSWqO+8lcgqlfaPU5je1lgHTJXIhDE4
         WsWJB5w2rGM738qQ1Hoh2I9DL6OQvz3gFH/j57eH4aKNxKdoi0hqaXsKrb1HNTcvj4W2
         eWKzRUSqAcibDn0sKsbljBd6CBQKkoMleBC8qHC+cPxhtzJUShEboc8ii7b9y9599VMq
         Nl/u1vu55YCpiVQQGJbASbCejkiqch556Z5ctwX6BvCl6eovB7H09eAg75dp98cG37WI
         uuRw==
X-Forwarded-Encrypted: i=1; AJvYcCX+nDA5o+YSF2cJ5HdTxMhhZ2jwYUt64p2C8/jGekJK0oezEJkFEzNSB2rRrf0HpHDGYYKVsvV90dWscGndqT0Tckc5e+lzAJnsGgIG
X-Gm-Message-State: AOJu0YzMzq89x3GRSZopkTyCwZpRmrP4n0IGs4brgRVzrSQj4loTYEsq
	CbeufBThZPET0MQ1F+5tnCPoLHXbvUATTGOWcgSHRNiEyw4tuwP7
X-Google-Smtp-Source: AGHT+IFg3xw+0ZVudlfm5n/W4rF1HiiD1YucYUMdRXsV4US1Q/BNo5ENea/QqSt1LEy1pQccA1e6fg==
X-Received: by 2002:a05:6870:d251:b0:222:3792:d968 with SMTP id h17-20020a056870d25100b002223792d968mr5680859oac.4.1710528585135;
        Fri, 15 Mar 2024 11:49:45 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id f17-20020a056a0022d100b006e6cc998be8sm3580784pfj.207.2024.03.15.11.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 11:49:44 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: linux-kernel@vger.kernel.org
Date: Sat, 16 Mar 2024 00:19:00 +0530
Message-ID: <20240315184908.500352-3-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240315184908.500352-1-ayushdevel1325@gmail.com>
References: <20240315184908.500352-1-ayushdevel1325@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: C311840A53
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.10 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.160.42:from];
	MIME_GOOD(-0.10)[text/plain];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_BLOCKED(0.00)[beagleboard.org:email];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_CC(0.00)[gmail.com,beagleboard.org,kernel.org,linaro.org,ti.com,amd.com,arndb.de,linuxfoundation.org,vger.kernel.org,lists.infradead.org,lists.linaro.org];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[]
Message-ID-Hash: QXN7OIA6BWUP57G5PASNCW2ZJ7KS3DFX
X-Message-ID-Hash: QXN7OIA6BWUP57G5PASNCW2ZJ7KS3DFX
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, robertcnelson@beagleboard.org, Vaishnav M A <vaishnav@beagleboard.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 2/8] w1: Add w1_find_master_device
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/QXN7OIA6BWUP57G5PASNCW2ZJ7KS3DFX/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add helper to find w1_master from w1_bus_master, which is present in
drvdata of platform device.

Signed-off-by: Vaishnav M A <vaishnav@beagleboard.org>
Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
---
 drivers/w1/w1.c     |  6 +++---
 drivers/w1/w1_int.c | 27 +++++++++++++++++++++++++++
 include/linux/w1.h  |  1 +
 3 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/w1/w1.c b/drivers/w1/w1.c
index afb1cc4606c5..ce8a3f93f2ef 100644
--- a/drivers/w1/w1.c
+++ b/drivers/w1/w1.c
@@ -673,9 +673,9 @@ static int __w1_attach_slave_device(struct w1_slave *sl)
 	sl->dev.of_node = of_find_matching_node(sl->master->dev.of_node,
 						sl->family->of_match_table);
 
-	dev_set_name(&sl->dev, "%02x-%012llx",
-		 (unsigned int) sl->reg_num.family,
-		 (unsigned long long) sl->reg_num.id);
+	dev_set_name(&sl->dev, "%s-%02x-%012llx", sl->master->name,
+		     (unsigned int)sl->reg_num.family,
+		     (unsigned long long)sl->reg_num.id);
 	snprintf(&sl->name[0], sizeof(sl->name),
 		 "%02x-%012llx",
 		 (unsigned int) sl->reg_num.family,
diff --git a/drivers/w1/w1_int.c b/drivers/w1/w1_int.c
index 3a71c5eb2f83..2bfef8e67687 100644
--- a/drivers/w1/w1_int.c
+++ b/drivers/w1/w1_int.c
@@ -242,3 +242,30 @@ void w1_remove_master_device(struct w1_bus_master *bm)
 	__w1_remove_master_device(found);
 }
 EXPORT_SYMBOL(w1_remove_master_device);
+
+/**
+ * w1_find_master_device() - find a master device
+ * @bm:	master bus device to search
+ */
+struct w1_master *w1_find_master_device(struct w1_bus_master *bm)
+{
+	struct w1_master *dev, *found = NULL;
+
+	list_for_each_entry(dev, &w1_masters, w1_master_entry) {
+		if (!dev->initialized)
+			continue;
+
+		if (dev->bus_master->data == bm->data) {
+			found = dev;
+			break;
+		}
+	}
+
+	if (!found) {
+		pr_err("device doesn't exist.\n");
+		return ERR_PTR(-ENODEV);
+	}
+
+	return found;
+}
+EXPORT_SYMBOL(w1_find_master_device);
diff --git a/include/linux/w1.h b/include/linux/w1.h
index 9a2a0ef39018..24269d0dd5d1 100644
--- a/include/linux/w1.h
+++ b/include/linux/w1.h
@@ -242,6 +242,7 @@ struct w1_master {
 
 int w1_add_master_device(struct w1_bus_master *master);
 void w1_remove_master_device(struct w1_bus_master *master);
+struct w1_master *w1_find_master_device(struct w1_bus_master *master);
 
 /**
  * struct w1_family_ops - operations for a family type
-- 
2.44.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
