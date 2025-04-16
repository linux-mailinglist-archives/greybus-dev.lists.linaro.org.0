Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA6CA8B9A7
	for <lists+greybus-dev@lfdr.de>; Wed, 16 Apr 2025 14:56:29 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B120B44965
	for <lists+greybus-dev@lfdr.de>; Wed, 16 Apr 2025 12:56:28 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	by lists.linaro.org (Postfix) with ESMTPS id 5DC3443D10
	for <greybus-dev@lists.linaro.org>; Wed, 16 Apr 2025 12:17:53 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=RkIzdu6n;
	spf=pass (lists.linaro.org: domain of braker.noob.kernel@gmail.com designates 209.85.219.169 as permitted sender) smtp.mailfrom=braker.noob.kernel@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e6e1cd3f1c5so5459475276.0
        for <greybus-dev@lists.linaro.org>; Wed, 16 Apr 2025 05:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744805873; x=1745410673; darn=lists.linaro.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wlP+HD1QHGE6iO/Q40BNz/pkmIckE06sYeotHoDiylw=;
        b=RkIzdu6nsbhYFotZicI8K0uLEO0kAjW8w+ZznDVZBJULwYGh9QW6Ut5637ltKhi+EH
         6kSXPSU0ygCLOqco7N4niDnoV8FG2DTxUxd9SBfQdwidCj0dyyx8mU519QIEJX/1RTpU
         jRI8wNdbegbsiF6gB/wTiZf7Tpk1/412GL/HY6ph0QVUhbksiUAtVcLfcAVK+E8ZjtGO
         rzAbvisOnqQef6kRn+OCiIAEPGKWQZtS7Moqbkv0aULrU9v4JVGCOUvZd8849QdWYNrp
         B8KbgoCkZvLgoUS71R+xncH+C1k1xFXI25NItCHgV7qGP60UNT/LMLnbNZOwSc/bpufw
         Dq/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744805873; x=1745410673;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wlP+HD1QHGE6iO/Q40BNz/pkmIckE06sYeotHoDiylw=;
        b=AKTnQ9kDRMrsRaxk3D1TCHWC0rAFFB9G+KNd2YkZGuQZAclMdlgyXqFEPG2Ol1iHp4
         KCIq2+uaQCaVWYRjTKRnS2CQtBMSpoHBN4PEP8pQvz6LTISglNkiz2Q/zglCmBLPMoRa
         gKYI9oDWfyVLpghET3JN3ZLwf2jhMxyh0hu7XkVn8Q+UQgcDn0ZpyLmKATiy1cC+PwmB
         oQWG2xWW7MjM7CxKC1dOGsNdKZavSxd7pMrgUDWtqErOhW4BerGvJOvvJEXMh5PQHcxV
         HMrYzgUkYLXjyS9zmoJNITyBhE8oSqmdNkKfUS6kansFsLucg4F5+TRAhpkM1WshzRcU
         9cBA==
X-Forwarded-Encrypted: i=1; AJvYcCUObpy/iXk65GdgUsgXOBOCaIKRzh/xR+RIAfHhn1ybaZbHbcvThvMzuxBrSFZdGZRNezmuDc1/aWWqzg==@lists.linaro.org
X-Gm-Message-State: AOJu0Yxyg/cAWTRHMvw3VDEu+mK13wUyVFMWrmEag1UgZ17oVNnDbvbs
	foQI5OE/g3yi0fzxU5bFIXvprqPJH0FDKv0h83DO9U/UfggabOKD0qc4FlRrSUfZ7pK52GdsZZJ
	nfxjT2WKqWBWutJqWUNUC0GPALRQ=
X-Gm-Gg: ASbGncuOenI4MZakW+sC394ZwLOS/M40dCRi/qAfdFi8cFGz7PUb9efEKZ2q1xNE/f7
	MrbLCu4+Z2+iRCg4Lwu7wzUWUMrcpDYbmWR2GHno8QOnlGzFefsjVDk8XFFsa4czbtP16rFQtsU
	OveiJhufYTcKsy+KDr3uIB/A==
X-Google-Smtp-Source: AGHT+IFf7/9q05WuLCBinmHHyeGqSzOB+G+Hb0UXzu8jeUcFvWiFNYdqGcy/Eywb7M0FxO5atgSkOuOsVuLpd6U1hlU=
X-Received: by 2002:a05:6902:2e85:b0:e5d:c97b:78a8 with SMTP id
 3f1490d57ef6-e7275e0091emr1955667276.36.1744805872702; Wed, 16 Apr 2025
 05:17:52 -0700 (PDT)
MIME-Version: 1.0
From: rujra <braker.noob.kernel@gmail.com>
Date: Wed, 16 Apr 2025 17:47:41 +0530
X-Gm-Features: ATxdqUHrKwJ4jWPaIt1lbeiS0wqqDkS38kmrf-1Bx-1WG1dvU1m4yJHUelL3ApE
Message-ID: <CAG+54DbvpWHyX8+ucEQpg2B6rNTJP11CRpYxcYVrKpKehzrK-A@mail.gmail.com>
To: ayushdevel1325@gmail.com, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
	outreachy@lists.linux.dev
X-Rspamd-Queue-Id: 5DC3443D10
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[];
	URIBL_BLOCKED(0.00)[mail.gmail.com:mid];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RBL_SENDERSCORE_REPUT_8(0.00)[209.85.219.169:from];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.219.169:from];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: braker.noob.kernel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: XEGHXIVOLX5ZR6FWSLDAB6EX3QFH6AB6
X-Message-ID-Hash: XEGHXIVOLX5ZR6FWSLDAB6EX3QFH6AB6
X-Mailman-Approved-At: Wed, 16 Apr 2025 12:56:22 +0000
CC: linux-kernel@vger.kernel.org, rujra <braker.noob.kernel@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [FIRST-PATCH] staging : greybus : gb-beagleplay.c : fixing the checks as first-patch
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XEGHXIVOLX5ZR6FWSLDAB6EX3QFH6AB6/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

added comments on spinlocks for producer-consumer model, rearranged the
lines on function calls where it should not end with "(" this bracket,
also removed white-spaces and aligned the arguments of function calls.

Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>

>8------------------------------------------------------8<

 drivers/greybus/gb-beagleplay.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/greybus/gb-beagleplay.c b/drivers/greybus/gb-beagleplay.c
index 473ac3f2d382..fa1c3a40dd0b 100644
--- a/drivers/greybus/gb-beagleplay.c
+++ b/drivers/greybus/gb-beagleplay.c
@@ -73,7 +73,9 @@ struct gb_beagleplay {
        struct gb_host_device *gb_hd;

        struct work_struct tx_work;
+       //used to ensure that only one producer can access the shared
resource at a time.
        spinlock_t tx_producer_lock;
+       //used to ensure that only one consumer can access the shared
resource at a time.
        spinlock_t tx_consumer_lock;
        struct circ_buf tx_circ_buf;
        u16 tx_crc;
@@ -642,8 +644,8 @@ static int cc1352_bootloader_wait_for_ack(struct
gb_beagleplay *bg)
 {
        int ret;

-       ret = wait_for_completion_timeout(
-               &bg->fwl_ack_com, msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
+       ret = wait_for_completion_timeout(&bg->fwl_ack_com,
+
msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
        if (ret < 0)
                return dev_err_probe(&bg->sd->dev, ret,
                                     "Failed to acquire ack semaphore");
@@ -680,9 +682,8 @@ static int cc1352_bootloader_get_status(struct
gb_beagleplay *bg)
        if (ret < 0)
                return ret;

-       ret = wait_for_completion_timeout(
-               &bg->fwl_cmd_response_com,
-               msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
+       ret = wait_for_completion_timeout(&bg->fwl_cmd_response_com,
+
msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
        if (ret < 0)
                return dev_err_probe(&bg->sd->dev, ret,
                                     "Failed to acquire last status semaphore");
@@ -765,9 +766,8 @@ static int cc1352_bootloader_crc32(struct
gb_beagleplay *bg, u32 *crc32)
        if (ret < 0)
                return ret;

-       ret = wait_for_completion_timeout(
-               &bg->fwl_cmd_response_com,
-               msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
+       ret = wait_for_completion_timeout(&bg->fwl_cmd_response_com,
+
msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
        if (ret < 0)
                return dev_err_probe(&bg->sd->dev, ret,
                                     "Failed to acquire last status semaphore");
--
2.43.0
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
