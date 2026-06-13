Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kM0xE13fL2obIQUAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 13:17:49 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD8B685A87
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 13:17:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b="J7/fjoW4";
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 133F840A7A
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 11:17:48 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	by lists.linaro.org (Postfix) with ESMTPS id 5469C40512
	for <greybus-dev@lists.linaro.org>; Sat, 13 Jun 2026 11:09:57 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49222fb062bso4949675e9.1
        for <greybus-dev@lists.linaro.org>; Sat, 13 Jun 2026 04:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781348996; x=1781953796; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LfLmR4y74+nAERkf87qCAjiTwREwiy9ZfP8ZT75R/W8=;
        b=J7/fjoW479xbnYGvgkY934PAk20bWZy9isXHNTerOEID0lvvAgzfbdH414DBQPF3S5
         IXCAqRZI1hISxX8MUaj9ELZsuBJ/8R0kGaczb/6c9doKdZcfZuDPKQk6UYIMAx5Z4UfD
         donyoguPHtlg8TLww+Cjoih7Vulje77EuPBfDKu7NBQxNZurWc6fZIQQNYTyyZqf5+yo
         JpiZDbhJMCpdJpNFqE7IcA3fO6yUa01798Eh+nvjAp4RdgRDUzJwDre73kFeSpSEtwWo
         uuikIDMNZRHVeIDvCNkOwqvlNJmpmcQwwBqOttjyQBjm3p1F6Y1KHWLKG6llEcBR3+sD
         AHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781348996; x=1781953796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LfLmR4y74+nAERkf87qCAjiTwREwiy9ZfP8ZT75R/W8=;
        b=ULsk02bzDnnAVJfy552bDLhid5FmnUJwCdCtW+F5rCv1AloD+nUZXFKbRFYsnPU0Vw
         nDiWEv3/1zlOyx5NLKl7qZwO/oV6DCTEF2i1v3yL7ZRVunVqWlcA+NMH6Mh2VJ05ZWj4
         CdplgTeRut4knJWmKkB6DU/B6ZCFZKClzYe6aR1jhV2gN8Zx58vzaZqX1BZt/cA3aMZP
         HoI3m0fZbLLZbK89AAG/Mm/E+Ra9xQ0j6KNbS1L5toct7xigm01z4SsGjyeYYjQ0P8GE
         enZ9OM9fXZKot8rORW9lijrET1ByFeHMELCU8tu4rgyEEQgE/S5gV7Zo8R5MyHJiH6Kn
         CtQg==
X-Gm-Message-State: AOJu0YxbXwI8r9imlyoi6y3S5Too2oODObCj5tfnZKIj5Gg4RUHtU6l6
	KBM1tzAF/2j1wktRx+/VUit+izXdGNkdqh4+LDnSq6dv/SEN02laIrmN
X-Gm-Gg: Acq92OH7m/ArK3qJhU4mBysXUbH9SfmIGoN5hwcE2rGD8xzxkdxSWetSqge6AyasGPg
	Qn/7pA8wRLKo8VSHKOVY54Kd1k1SNsy3FyPt/xGEY6GeBhTJJqWfwbtlfcCkRoYW/0Qb2w7Nb/V
	yuSXKY9rpc0dQPqiVWBENkE1H0qLSl7MHgtGQgRGNK4fsmE0+B6+6RlGiSQB8XAyk1lN0XoukcD
	CbYB6FFkVSJae+i9IGIfTEtgYFX7FoHVVgeDGJahBfpUbPg58n/vA7aSZOzMQJ+vl+i4kue/PoV
	Mxp3TV3PtdmJ6H+o3pMMcrsIb5b6KHwpNsgPqJXxOrfDJ9Ct2YIn4fxnHHz/ygTqa6QkjpkF7AL
	d1rXzEYdIyif9Z7LIx27kDZ/1PIoR6R+DwZMlR+JsiHBkyaHLjupV1pHsUIcL8S+ccxj1Sk4kBy
	zIaUh1GtsP4lhYWzZTXL1c08BVpc/lLRAVI4lGYk1VUu7SBg==
X-Received: by 2002:a05:600c:3513:b0:490:ae94:a7e6 with SMTP id 5b1f17b1804b1-490ec4ee41fmr81296115e9.24.1781348996139;
        Sat, 13 Jun 2026 04:09:56 -0700 (PDT)
Received: from fedora ([154.182.122.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922033156csm62256155e9.7.2026.06.13.04.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 04:09:55 -0700 (PDT)
From: abdelnasser hussein <abdelnasserhussein11@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sat, 13 Jun 2026 14:07:48 +0300
Message-ID: <20260613110748.13497-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: abdelnasserhussein11@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 5J3I3MIOWA3JY6P2BT6UEALK2IKF5U6Z
X-Message-ID-Hash: 5J3I3MIOWA3JY6P2BT6UEALK2IKF5U6Z
X-Mailman-Approved-At: Mon, 15 Jun 2026 11:17:30 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, abdelnasser hussein <abdelnasserhussein11@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: audio: evaluate sscanf() return value directly
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5J3I3MIOWA3JY6P2BT6UEALK2IKF5U6Z/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	DATE_IN_PAST(1.00)[48];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:vaibhav.sr@gmail.com,m:mgreer@animalcreek.com,m:johan@kernel.org,m:elder@kernel.org,m:gregkh@linuxfoundation.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:abdelnasserhussein11@gmail.com,m:vaibhavsr@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com,kernel.org,linuxfoundation.org];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	FORGED_SENDER(0.00)[abdelnasserhussein11@gmail.com,greybus-dev-bounces@lists.linaro.org];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abdelnasserhussein11@gmail.com,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EFD8B685A87

Smatch warns:
  drivers/staging/greybus/audio_codec.c:335 gbaudio_module_update()
  warn: sscanf doesn't return error codes

sscanf() returns the number of successfully matched input items, not a
negative error code. Do not store its return value in ret. Check it
directly instead.

Signed-off-by: abdelnasser hussein <abdelnasserhussein11@gmail.com>
---
 drivers/staging/greybus/audio_codec.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index 720aa752e17e..295222ec0f1a 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -311,8 +311,7 @@ int gbaudio_module_update(struct gbaudio_codec_info *codec,
 	}
 
 	/* parse dai_id from AIF widget's stream_name */
-	ret = sscanf(w->sname, "%s %d %s", intf_name, &dai_id, dir);
-	if (ret < 3) {
+	if (sscanf(w->sname, "%s %d %s", intf_name, &dai_id, dir) != 3) {
 		dev_err(codec->dev, "Error while parsing dai_id for %s\n", w->name);
 		return -EINVAL;
 	}
-- 
2.52.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
