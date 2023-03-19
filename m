Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9226C39D5
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 20:07:52 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7E287441DD
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 19:07:51 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	by lists.linaro.org (Postfix) with ESMTPS id 99F5A3E96A
	for <greybus-dev@lists.linaro.org>; Sun, 19 Mar 2023 13:25:49 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=mNQgmGbT;
	spf=pass (lists.linaro.org: domain of eng.mennamahmoud.mm@gmail.com designates 209.85.208.49 as permitted sender) smtp.mailfrom=eng.mennamahmoud.mm@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id w9so37244652edc.3
        for <greybus-dev@lists.linaro.org>; Sun, 19 Mar 2023 06:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679232348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1ZHVKRyqUkVQgHIPcnrjM4VftHtoW1MPmlfE9Rq46vI=;
        b=mNQgmGbT+HVA15+DOSJlLUEnpBIvOyX+j5cvdZStAMH3VF92O9PT06RNqnKRcLovaL
         P30ex7z0Rp9MyvhsrqrkReKNRvyDU8AwDnEANAvLUiQ6kvbh9Uru5Up9soTO/7BSyub8
         Sd58TAIV1/wEw/MjVS5H4ulLp8ToU4GBHkw/APoVrk4OPB9rBU1ml8FlRR1IicVjvqnU
         TIVfbOmEHMt2YTG0rr16Qxh3pVdfbKIs0nVC4oMTf0MSbp0tnoRKdErZji/f+qQ2jf0u
         WXpQJjZ/5ob5O6P+f2bPFt6qcqoEEpnPUkHalWUkXthEOEMawcOA2WqTCGknztflUuhD
         /FJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679232348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ZHVKRyqUkVQgHIPcnrjM4VftHtoW1MPmlfE9Rq46vI=;
        b=d9/Zf9BRtUqyonfQdvsAF4Vl9ZJr3k6UrasgDxxD6yFmC50WhrjdT2gvQ/W3l0SMcN
         9K4L/eBUojf9qj3RBVcl5NCkBP+iC96Q9bYXeC5Qhi+vGgXLr2ODoTbtXTgDCBuZlsZ6
         mMpSwYOiVuefrQHfC8N31emdvnkFcX7Ki1s07vRDmkzMOxxrV9QI5aQNyYdU700JwxQu
         XRMqt+BsEaKQRIfvvIkeBslDzYqM1VzSND8uB1Is47mqrDGhPnZvatooapAgyzd0LnQE
         DHmLeiHMtOqST4nG0wWiy3z41aZVENTQwyjbWCXH6Z179hlKrb6W68B3XjnWpLtJUcwL
         uhOQ==
X-Gm-Message-State: AO0yUKVtqjijeIwiGfreVdciTYlxjwO9jIIU0gcHqB8TIYFeR9C9/L+R
	qofgCQ5lfg+1lhzckbWwdtk=
X-Google-Smtp-Source: AK7set/2uQPzlmU1OHFq9zDhnY7GnvreG7DHR7u3GAV4giydFft8V9GEoMXX+yqrcLSXhEr6GQVUyw==
X-Received: by 2002:a17:906:2e91:b0:931:7c20:f75a with SMTP id o17-20020a1709062e9100b009317c20f75amr5049951eji.53.1679232348497;
        Sun, 19 Mar 2023 06:25:48 -0700 (PDT)
Received: from alaa-emad.. ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id by22-20020a170906a2d600b008cecb8f374asm3235200ejb.0.2023.03.19.06.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 06:25:48 -0700 (PDT)
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
To: gregkh@linuxfoundation.org
Date: Sun, 19 Mar 2023 15:24:51 +0200
Message-Id: <20230319132452.151877-2-eng.mennamahmoud.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 99F5A3E96A
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
	RCPT_COUNT_SEVEN(0.00)[9];
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
Message-ID-Hash: ZWYMUDMJMJT26D6S2CLE2EYECMSAAK5T
X-Message-ID-Hash: ZWYMUDMJMJT26D6S2CLE2EYECMSAAK5T
X-Mailman-Approved-At: Tue, 21 Mar 2023 19:06:56 +0000
CC: outreachy@lists.linux.dev, vireshk@kernel.org, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, eng.mennamahmoud.mm@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH RESEND] staging: greybus: remove unnecessary blank line
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZWYMUDMJMJT26D6S2CLE2EYECMSAAK5T/>
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
