Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6886B5576
	for <lists+greybus-dev@lfdr.de>; Sat, 11 Mar 2023 00:18:38 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4923A3F4A4
	for <lists+greybus-dev@lfdr.de>; Fri, 10 Mar 2023 23:18:37 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	by lists.linaro.org (Postfix) with ESMTPS id 745FB3F4AC
	for <greybus-dev@lists.linaro.org>; Fri, 10 Mar 2023 22:18:08 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=EolZ2GUx;
	spf=pass (lists.linaro.org: domain of kamrankhadijadj@gmail.com designates 209.85.128.51 as permitted sender) smtp.mailfrom=kamrankhadijadj@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id o38-20020a05600c512600b003e8320d1c11so5284570wms.1
        for <greybus-dev@lists.linaro.org>; Fri, 10 Mar 2023 14:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678486687;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sNL5tb1P3HVDygsPysD8xPwAJ0vtyz597vInjuBEdDE=;
        b=EolZ2GUxSxBNqUSHRcX6PIBE6bNo6syz8kES+5pER0SmCZatB7g2mSqteLxvKUF0Vp
         ak8AKBk96lIn4UtndtJt6x1MncJG+U2YhKvlCO6r93Q7zLjDlEdyvywJSTiJLF67y56C
         WqoMQX/hT4KkDwftrxegHivk0n6FxK9UDXf/z/DM66Hnk3o657V8zNK0yh5L9RMDftNN
         eFaulCaRaWJashCNGFT3L05ZWYxv+jIuDYrB2FwNPi0Wkn99CyKIJOxKk7kPpIQ45LLQ
         j9zk8rdyZhOcyNrtM+bCclUzsbhcppu2G074qZVRAwlbQdNrhG595+zJmTobQnRUiXUs
         E1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678486687;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sNL5tb1P3HVDygsPysD8xPwAJ0vtyz597vInjuBEdDE=;
        b=L3w+8XS7m1secTz2BPskvC/PYxg2QrUnsiKOzDmuh71TE/tl8N3mlMV5SMp7T2OlMo
         jAeh/Mn5OE5ek6D/y7iTbSRzfiv+/hwYtDuDESpanIuFp9xz/bJfclf70ZWggM1aFdTH
         0XHxPx2WFwcSPvbGEmA8PMAVDlRDuunGFRYR6Ozfk1eBIdKF8hxyIOyhdfTA/P/bWEY0
         lTXICVUvOa+fltdpHlecorIAo4YKdLGKbxjgEapB0ubFWsit4HzQmQkdzgxVCvZe0kx7
         cxmm5cmU1/QlvMtn0qwLYQ0q3IfLap9j0jeqe4SDGE1xUzJzPObosj42cRcbzNckdE4K
         l+nw==
X-Gm-Message-State: AO0yUKWcJ/U2myhjLWLlr8xYVOKzXDbTKia8rVOPKtHCNDXc999dImvQ
	Q9A0PxVfKrzq+CWE+EauQTc=
X-Google-Smtp-Source: AK7set/Ulh7uhrPNen1gDfIDPuRQqFNE+Hp0ld+Z0JAMHiM3u6WevTQQZ4mMtbs71khUslIDVK97Tw==
X-Received: by 2002:a05:600c:4453:b0:3eb:1432:a78c with SMTP id v19-20020a05600c445300b003eb1432a78cmr4046508wmn.37.1678486687338;
        Fri, 10 Mar 2023 14:18:07 -0800 (PST)
Received: from khadija-virtual-machine ([39.41.45.115])
        by smtp.gmail.com with ESMTPSA id t1-20020a05600c2f8100b003e896d953a8sm1126429wmn.17.2023.03.10.14.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 14:18:06 -0800 (PST)
Date: Sat, 11 Mar 2023 03:18:04 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Message-ID: <ZAusnKYVTGvO5zoi@khadija-virtual-machine>
MIME-Version: 1.0
Content-Disposition: inline
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 745FB3F4AC
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TAGGED_RCPT(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.51:from];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: kamrankhadijadj@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: ODK4LHWWWWFL47DHZWTWTWTV3EVQ3Q44
X-Message-ID-Hash: ODK4LHWWWWFL47DHZWTWTWTV3EVQ3Q44
X-Mailman-Approved-At: Fri, 10 Mar 2023 23:17:53 +0000
CC: Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] staging: greybus: remove tabs to fix line length and merge lines
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ODK4LHWWWWFL47DHZWTWTWTV3EVQ3Q44/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In file drivers/staging/greybus/arche-platform.c,
- Length of line 181 exceeds 100 columns, fix by removing tabs from the
  line.
- If condition and spin_unlock_...() call is split into two lines, join
them to form a single line.

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
Changes in v2:
 - Change the subject and log message
 - Merge if condition and spin_unlock...() from two lines to one 
 drivers/staging/greybus/arche-platform.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index fcbd5f71eff2..00ed5dfd7915 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -176,12 +176,10 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
 				 * Check we are not in middle of irq thread
 				 * already
 				 */
-				if (arche_pdata->wake_detect_state !=
-						WD_STATE_COLDBOOT_START) {
+				if (arche_pdata->wake_detect_state != WD_STATE_COLDBOOT_START) {
 					arche_platform_set_wake_detect_state(arche_pdata,
-									     WD_STATE_COLDBOOT_TRIG);
-					spin_unlock_irqrestore(&arche_pdata->wake_lock,
-							       flags);
+						WD_STATE_COLDBOOT_TRIG);
+					spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
 					return IRQ_WAKE_THREAD;
 				}
 			}
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
