Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4046F6D43A1
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 13:37:18 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 495373ED7B
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 11:37:17 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	by lists.linaro.org (Postfix) with ESMTPS id E6C4A3ED16
	for <greybus-dev@lists.linaro.org>; Sun,  2 Apr 2023 12:29:05 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=T9C2x6tL;
	spf=pass (lists.linaro.org: domain of angelalbertoc.r@gmail.com designates 209.85.221.51 as permitted sender) smtp.mailfrom=angelalbertoc.r@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id v1so26659733wrv.1
        for <greybus-dev@lists.linaro.org>; Sun, 02 Apr 2023 05:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680438545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KuUlpAuMuhV9A7Ol8z+aU98hs8SWlHqvB5/lhugn4Hk=;
        b=T9C2x6tLoLpcxgjAt71Z1h1HV2OyyO+4KCC4rZwqZHTOS0EFN2sAY9SstJJOpPxZMh
         2ES8ZtcnnGdX9ErXt9XZQYpgxFKHGi/NVu4VeNYO65TSbECD3oCOGiy2hV7lC4iM7NCi
         zrB68IVghSucVU3mVASoDP2ry0w8rAkEK7rYvQwp/kbYzo39v3ZU7Hl3KHngMMHRepd7
         ctIdpqh8Pt4zxH9iIbE5Tay4GTj2mieSnizJbqerMZ7wUT86inViLk72TCK0BO+C6e9k
         OhfFsvKaat9f+cg+y1KZlWO8ixy8GeCdX/BMJ9QlA+vQrHnl2GlFLZCvx45QsnuvRR1c
         dlOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680438545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KuUlpAuMuhV9A7Ol8z+aU98hs8SWlHqvB5/lhugn4Hk=;
        b=S7KkKMEBS60JqRCU05KwocTnTPqLwO+Co6YdR0m66Ljkhy1FRS7K3E2AI+cSJ4auCb
         QAT+eVPSTBW7AsCif9f8qt2gyOQtrPqYD6NcE2xd/vfGYG027blLXckcGe4vWK9CkBYi
         KHxdri68lzYzYEDeTDYqIYApakdpnN9SfNaOHpvcm0e20xtbWdXYiUU/a/qLoUqEf8MU
         J74p0Lt/s14ABTBjUusczlPaQDrK4W+BuM9XtGMB32PrrJJtDjq+lGGrAx2QRqbAalAr
         /C2IdDMvdNgH5vcn5N3i3Fg24YJyYy8WmwMUiagcEknUOqb2Lb53mVo/8Dq1Lh4Uzdmp
         t9Yg==
X-Gm-Message-State: AAQBX9fo4L6RcMR4NbLIpjtOOX+PvcqSHgLcoyByhrJkSlslZqOvUjkq
	iUYvlPpdQD8/mTAAytpPfHg=
X-Google-Smtp-Source: AKy350Zt2LHhRlwXRTSDoWEQjQ4BvMtwoMbyN+POOrEFbySFdw8LOMlkl9O0bDOvllagr3j4Dwnt7Q==
X-Received: by 2002:adf:df11:0:b0:2e4:e6b3:78ca with SMTP id y17-20020adfdf11000000b002e4e6b378camr8297688wrl.70.1680438544676;
        Sun, 02 Apr 2023 05:29:04 -0700 (PDT)
Received: from arch.localdomain ([2a0c:5a82:e403:1200:d6da:3a66:5cd6:7fe8])
        by smtp.googlemail.com with ESMTPSA id d7-20020adfe2c7000000b002d419f661d6sm7202530wrj.82.2023.04.02.05.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 05:29:04 -0700 (PDT)
From: Angel Alberto Carretero <angelalbertoc.r@gmail.com>
To: "Bryan O'Donoghue" <pure.logic@nexus-software.ie>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Date: Sun,  2 Apr 2023 14:25:51 +0200
Message-Id: <20230402122550.70682-1-angelalbertoc.r@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: E6C4A3ED16
X-Spamd-Bar: -------
X-Spamd-Result: default: False [-7.00 / 15.00];
	DWL_DNSWL_HI(-3.50)[gmail.com:dkim];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	RCVD_IN_DNSWL_HI(-0.50)[2a0c:5a82:e403:1200:d6da:3a66:5cd6:7fe8:received];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_IN_DNSWL_NONE(0.00)[209.85.221.51:from];
	RCVD_COUNT_TWO(0.00)[2];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.51:from];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: angelalbertoc.r@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: JFVGMKYN2Z57H33PUSC4I6BHMKB5PUFT
X-Message-ID-Hash: JFVGMKYN2Z57H33PUSC4I6BHMKB5PUFT
X-Mailman-Approved-At: Mon, 03 Apr 2023 11:36:41 +0000
CC: Angel Alberto Carretero <angelalbertoc.r@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: loopback: fix up checkpath macro do while error.
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JFVGMKYN2Z57H33PUSC4I6BHMKB5PUFT/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Wrap macro in a do-while statement.

Signed-off-by: Angel Alberto Carretero <angelalbertoc.r@gmail.com>
---
 drivers/staging/greybus/loopback.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index d7b39f3bb652..371809770ed0 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -162,9 +162,11 @@ static ssize_t name##_avg_show(struct device *dev,		\
 static DEVICE_ATTR_RO(name##_avg)
 
 #define gb_loopback_stats_attrs(field)				\
-	gb_loopback_ro_stats_attr(field, min, u);		\
-	gb_loopback_ro_stats_attr(field, max, u);		\
-	gb_loopback_ro_avg_attr(field)
+	do {		\
+		gb_loopback_ro_stats_attr(field, min, u);		\
+		gb_loopback_ro_stats_attr(field, max, u);		\
+		gb_loopback_ro_avg_attr(field);		\
+	} while (0)
 
 #define gb_loopback_attr(field, type)					\
 static ssize_t field##_show(struct device *dev,				\
-- 
2.40.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
