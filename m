Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AE66D439B
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 13:36:45 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9DC9A3F58A
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 11:36:44 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	by lists.linaro.org (Postfix) with ESMTPS id 167593E8F3
	for <greybus-dev@lists.linaro.org>; Thu, 30 Mar 2023 14:11:31 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=CDHvrnew;
	spf=pass (lists.linaro.org: domain of kamrankhadijadj@gmail.com designates 209.85.221.54 as permitted sender) smtp.mailfrom=kamrankhadijadj@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id j24so19276663wrd.0
        for <greybus-dev@lists.linaro.org>; Thu, 30 Mar 2023 07:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680185490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=suzBhYGEckJpiDnidEm8UQbSBjCPRce9GnZilv1Z3Sk=;
        b=CDHvrnewhzU2bDj2QxJ/1JEUE1icAzUTwPeXhc99jWN3pDvmcBH3G7v/mVLl2BGIi4
         Py3Cdi9JQE5UPkM6UB7yE8eYKOwfWLLmF0sbkaYbY5XOi95XDHYnM1Yg5Gz6bQXHAqDN
         Z4H4cYw6yItdRsHQ4vzZ4b5HGU7vjU9Kl7nrhOFuycWr10H6p2cDpLyOlRJLMhVSGWvD
         9ctZSg06op0wrCBvJyYmUxnUPxrVY6OS3iQ1Ocsu1oWvCM4vf2KZUVlIPxZ0PDd0hukY
         3c2jHh+SfgIG3eYcUxMHzmHwtW41FigkG9mU5lUWCAt4SCCBDtES7uQz/1XrUdFTNy2d
         R6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680185490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=suzBhYGEckJpiDnidEm8UQbSBjCPRce9GnZilv1Z3Sk=;
        b=UNoT/TkkzkzZWfVVY5e5F0bevd2WCn3JD7rqmQEmmtHGntbZ39lPDAFt5UzGrZ5Az0
         3N4o1EW6lgDWL7Wi6EHpir2HDIWBSDAgZswKTS/V9W7mwaDGcr3k8/MKiopK66RcFAWC
         z4r5XwWV6CllurFhE4Z5gp9BL9dxbDMFuB7KWBnzyIK7sF2ozcEEx8sWTXDE56Zi1YRY
         DUfes/qpoCoHsevY5TAfDDibvD3QQS6BRZN+uY/bk3iez+wbyqYSmH76hBK57x0E7KqI
         yyCoxNmV+b+RAyCSXGPmiYFNGfrkM0hR746XlEvPMDHchTYysu/whi52/v1QN6bsLNk7
         R5QA==
X-Gm-Message-State: AAQBX9fdaH/St40L/qtPVN2g/s7zANAtw/LRg84UgC5tFkfi9HWcK6eJ
	AQi/fJty7RA/aiY5SToDhR4=
X-Google-Smtp-Source: AKy350bro9ZzpIVJRHW9Gvn4LewJPSesVpqGyWOYSPIH7E/0ujl20zY5nVejXjg/5v17iKNiuhUA6g==
X-Received: by 2002:a5d:63d1:0:b0:2d5:b6a9:772a with SMTP id c17-20020a5d63d1000000b002d5b6a9772amr18420910wrw.17.1680185489816;
        Thu, 30 Mar 2023 07:11:29 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id b5-20020adfee85000000b002c573778432sm32761705wro.102.2023.03.30.07.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 07:11:29 -0700 (PDT)
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Date: Thu, 30 Mar 2023 19:11:23 +0500
Message-Id: <cover.1680185025.git.kamrankhadijadj@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 167593E8F3
X-Spamd-Bar: /
X-Spamd-Result: default: False [-1.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.54:from];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_NONE(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: kamrankhadijadj@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: J5YTKCFT2ZFTJVKLLLSTR2I3H7J6HDAL
X-Message-ID-Hash: J5YTKCFT2ZFTJVKLLLSTR2I3H7J6HDAL
X-Mailman-Approved-At: Mon, 03 Apr 2023 11:36:41 +0000
CC: hvaibhav.linux@gmail.com, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 0/2] improve arche_platform_wd_irq() function
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/J5YTKCFT2ZFTJVKLLLSTR2I3H7J6HDAL/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Improve arche_platform_wd_irq() function to minimize indentation and fix
checkpatch issues.

Khadija Kamran (2):
  staging: greybus: add a single exit path to arche_platform_wd_irq()
  staging: greybus: refactor arche_platform_wd_irq()

 drivers/staging/greybus/arche-platform.c | 84 ++++++++++++------------
 1 file changed, 43 insertions(+), 41 deletions(-)

-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
