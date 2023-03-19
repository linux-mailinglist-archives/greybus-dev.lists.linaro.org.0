Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E596C39D2
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 20:07:36 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 58B9C441DD
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 19:07:35 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	by lists.linaro.org (Postfix) with ESMTPS id 6ED293EF88
	for <greybus-dev@lists.linaro.org>; Sun, 19 Mar 2023 11:42:03 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=etS4Y9P+;
	spf=pass (lists.linaro.org: domain of eng.mennamahmoud.mm@gmail.com designates 209.85.208.44 as permitted sender) smtp.mailfrom=eng.mennamahmoud.mm@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id w9so36709882edc.3
        for <greybus-dev@lists.linaro.org>; Sun, 19 Mar 2023 04:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679226122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ZHVKRyqUkVQgHIPcnrjM4VftHtoW1MPmlfE9Rq46vI=;
        b=etS4Y9P+MAqZ3qeshJXE0XPH+xaAZBuPj4c71JZtAato2AI3nreH1nf4wnA0tNb+xw
         gVHys/1ORXAAjsH+xlz+Dcspth2rhy9K2CosWWypIh1Y+hdgjATjQHqbNPl1E/dF2gLZ
         aTks6NhBVYWrNEUoDnAfoG+LDzXhEGXOEvOz7aL/pOvDHUZUpFR557fkXs4F2/WTBLXw
         np7hqqyascOpbq+ULLutE58tkJriUC3SR1jFYFDFZD2eWkSKwupDep5tRPUNMeYS2OPv
         f4G5jgXfWyFanrEVYy8TWL5cFsboV5qlxZh6U4pqRMRb6SCqqyJzEJh/5xbgtIo4unHs
         VeDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679226122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ZHVKRyqUkVQgHIPcnrjM4VftHtoW1MPmlfE9Rq46vI=;
        b=qOsz475TBHwRAylEMJtC6M0hwm+UOkSZH9W5vxNV0b1380gkXCtJiOYwVY1FArbis/
         IXS9939VX3E3jdJPibId0dMlHaQACLjmFeI1A4v1fYanTrXCFiQvZpUiWDve4RPR017b
         DW+JKlloBMGQ/p5T7RS0KycbcyEGLFFBrCjQ5ZSvE9lFCCetTv6wdJNyCLmQv9x6UghV
         Ej2fYBmHwXI+a8h3yO68FWz1edAHkMJNDqch2UY6D3D+AKWces1Fa6xQ+BriI8UBkly/
         hjeL+cBNsfuKPvESe3OS0K6sXDvapJWUWCzAGyC7PaRKe506w4b6BmbJaQBuIo97IG5V
         MmcA==
X-Gm-Message-State: AO0yUKWxJ2AP1fqREZ/k1JOc9NlbGkCwCvORULsaOobgjkg3NePaSxB2
	wfX/tU1qRkEQEqzC21YtPrA=
X-Google-Smtp-Source: AK7set8+73Y1DR8RnHNNwoEuwKsFRyWb+UaHr5kq7a7sMnBvoZ80trvGxqWUKIIEcGTvSQ2sdd3A1Q==
X-Received: by 2002:a17:907:7642:b0:8f3:8bfd:a8e with SMTP id kj2-20020a170907764200b008f38bfd0a8emr5351877ejc.26.1679226122490;
        Sun, 19 Mar 2023 04:42:02 -0700 (PDT)
Received: from alaa-emad.. ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id b7-20020a1709063f8700b008eddbd46d7esm3180681ejj.31.2023.03.19.04.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 04:42:02 -0700 (PDT)
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
To: gregkh@linuxfoundation.org
Date: Sun, 19 Mar 2023 13:41:55 +0200
Message-Id: <20230319114155.42148-2-eng.mennamahmoud.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230319114155.42148-1-eng.mennamahmoud.mm@gmail.com>
References: <20230319114155.42148-1-eng.mennamahmoud.mm@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 6ED293EF88
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	FROM_HAS_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.44:from];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,lists.linaro.org,vger.kernel.org,gmail.com];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_NONE(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: eng.mennamahmoud.mm@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: UIMHHFZAHSWFKLOQXP7KB2MDMLP3GVAV
X-Message-ID-Hash: UIMHHFZAHSWFKLOQXP7KB2MDMLP3GVAV
X-Mailman-Approved-At: Tue, 21 Mar 2023 19:06:55 +0000
CC: outreachy@lists.linux.dev, vireshk@kernel.org, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, eng.mennamahmoud.mm@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: remove unnecessary blank line
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/UIMHHFZAHSWFKLOQXP7KB2MDMLP3GVAV/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Remove unnecessary blank line before struct as reported
by checkpatch:

" CHECK: Please don't use multiple blank lines "

Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
---
 drivers/staging/greybus/greybus_authentication.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/greybus/greybus_authentication.h b/drivers/staging/greybus/greybus_authentication.h
index 7edc7295b7ab..48b4a9794d3c 100644
--- a/drivers/staging/greybus/greybus_authentication.h
+++ b/drivers/staging/greybus/greybus_authentication.h
@@ -41,7 +41,6 @@
 #define CAP_AUTH_RESULT_CR_NO_KEY	0x03
 #define CAP_AUTH_RESULT_CR_SIG_FAIL	0x04
 
-
 /* IOCTL support */
 struct cap_ioc_get_endpoint_uid {
 	__u8			uid[8];
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
