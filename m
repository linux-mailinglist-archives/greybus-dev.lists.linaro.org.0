Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YUA1Nyo9PWq9zwgAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 25 Jun 2026 16:37:30 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id B90366C6B86
	for <lists+greybus-dev@lfdr.de>; Thu, 25 Jun 2026 16:37:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=sb9pwxnE;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D2EFF40C9E
	for <lists+greybus-dev@lfdr.de>; Thu, 25 Jun 2026 14:37:29 +0000 (UTC)
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	by lists.linaro.org (Postfix) with ESMTPS id 592D4401CC
	for <greybus-dev@lists.linaro.org>; Thu, 25 Jun 2026 11:16:51 +0000 (UTC)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-30c23abc62eso2408516eec.1
        for <greybus-dev@lists.linaro.org>; Thu, 25 Jun 2026 04:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782386210; x=1782991010; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1lY6wwCmnan7xgttBtmnV+eq+UmPFxIzOyt1ELNCEc=;
        b=sb9pwxnEKvMaNtVdc8gr3rOA5rjC/GZjRYs64jXwn4PcKcibYUJj+MCVxpCcxBV2x5
         6VlNDkmwOoqdkx+oa89sYhw91P+6f1abxLyzgNQ8UObfNgN1WRBfsu1oUpjnEwQOnNSx
         OC5ogbT7tk+AcW3KeGC2rZICYsgKKRaqkmF1IjPyhL1GUeMUxx1p1TgicLazXykJE6BF
         efBw06ZQG9VVN30GkXkRZf0sHb0Itx02vD/5g2P4ewJsKZGKyhZ3nEnIgbuAfFEyrLJk
         70LsaSFWxhLA6AqvoJQfYYuDHpsSy5/QvvN8NfKRLOR4yfEaWZS3dCoKEMyvyvWp5M/M
         pgwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782386210; x=1782991010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B1lY6wwCmnan7xgttBtmnV+eq+UmPFxIzOyt1ELNCEc=;
        b=o+o5XFLbaP8sacRi7J3EgwST6dEVFli6fWszjTulrlmUsC2lEsAYdMhLflsrNbIYfl
         G+s2n47LrKYgprgY2S/vQuADiJ0gvt/sPgLA3V8ochd22h26DGwVtgii+mTQIFPTMVMS
         JUkrDyHfNJOGnxGKr58b879c28mJJ8pkr0+GMQRZp/3SeLd2BFqxihrd9mYPCPtLRikA
         +Xp1uMoYkETSOMTCxyF0vvRVWY7CnPLKCqGpE/SfsvRS8qQHvkfrtA9F75T6RRvQ51r1
         6xZHAGM+xgpZ3Va8itLvmTUg5OitbYiDQtlRaoQPGyPW7Y5Afb03s3QtdaqhosjWBMC2
         JeTw==
X-Forwarded-Encrypted: i=1; AHgh+RoJJ/SVS92teECm/QP+Ug0cLPIq9g8ciKZsWGoC09uoZYV65oy0+RjtGhJZzPHC0Ot+sqG5kLuk4TRE1Q==@lists.linaro.org
X-Gm-Message-State: AOJu0YykYEGewunsqadIAI9H9YBuZYMryyR05ks6Cj6SyKzJKwPJoesG
	sqMEmxeO5fURpLxLolXBZ02Z6Oig7BN1uxUiINZoj5g6yfOxEc/Z0CHI
X-Gm-Gg: AfdE7cmDOMnjk0L7vlXn28GIg4wYVZBFfTjRDzs5aBapPLYMbjHhPbsfd3H/iAPKWP1
	mUsxCK3A1B1PAgUrMlH9o6bgv8zaAlylNpbLEKoDYWF43vLN1OtkvbNgGYh+CMobTTjtdz6kqx8
	artKs5W6dwzZhE3mhgjvjtkBiDo1pOcr//L2TrH7FUonkgOgsFXzbs/qs0B/DEaSiNhmYTBoqY+
	YRGbQE+UmzIci/kMBdTn7Mj9vK4grESUM0I+/8mqcG9AS7FQ3FLO7uZh/MFTHcZXJzCPXJ7JSRq
	ncv9MollihwSikDligtsPWjXpFLFScX/1/8YCBta2VmL69ZUXmY3KOkiyZFuO6skXslfFmE5ywN
	1Z95etrMpNvWvJp22YvywJ8UnID6PPoCoBR6OVpfIrTkrGFeCgKkNDsTTaJE70DnhxiFkWtt++c
	HAW6F+qYR3jZA4TUb1gSghOeE1FKv5sM97Zw==
X-Received: by 2002:a05:7300:e683:b0:30c:2964:67b5 with SMTP id 5a478bee46e88-30c84bccf37mr2272357eec.11.1782386210298;
        Thu, 25 Jun 2026 04:16:50 -0700 (PDT)
Received: from 10-86-27-11.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7ca5e601sm7915909eec.25.2026.06.25.04.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 04:16:49 -0700 (PDT)
From: suryasaimadhu <suryasaimadhu369@gmail.com>
To: error27@gmail.com
Date: Thu, 25 Jun 2026 19:16:37 +0800
Message-ID: <20260625111637.311831-1-suryasaimadhu369@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <aj0CZOUlYlJydfPd@stanley.mountain>
References: <aj0CZOUlYlJydfPd@stanley.mountain>
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: suryasaimadhu369@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: VD6FBQV7JKBB5TCGJMESK6ZASRJ4UPIR
X-Message-ID-Hash: VD6FBQV7JKBB5TCGJMESK6ZASRJ4UPIR
X-Mailman-Approved-At: Thu, 25 Jun 2026 14:37:01 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, suryasaimadhu <suryasaimadhu369@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: add meaningful comments to mutex declarations
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/VD6FBQV7JKBB5TCGJMESK6ZASRJ4UPIR/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:error27@gmail.com,m:johan@kernel.org,m:elder@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:suryasaimadhu369@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[suryasaimadhu369@gmail.com,greybus-dev-bounces@lists.linaro.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[suryasaimadhu369@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,lists.linaro.org:from_smtp,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B90366C6B86

The gbaudio_codec_info struct has two mutexes whose purpose was
not documented:

- lock: serializes DAI stream enable/disable operations and
  module_list/dai_list access in gbaudio_module_update() and
  gbcodec DAI ops
- register_mutex: serializes module register/unregister operations
  including DAPM controls, widgets and routes in
  gbaudio_register_module() and gbaudio_unregister_module()

Signed-off-by: suryasaimadhu <suryasaimadhu369@gmail.com>
---
 drivers/staging/greybus/audio_codec.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/greybus/audio_codec.h b/drivers/staging/greybus/audio_codec.h
index f3f7a7ec6..3d92ac8a0 100644
--- a/drivers/staging/greybus/audio_codec.h
+++ b/drivers/staging/greybus/audio_codec.h
@@ -70,7 +70,15 @@ struct gbaudio_codec_info {
 	struct list_head module_list;
 	/* to maintain runtime stream params for each DAI */
 	struct list_head dai_list;
+	/*
+	 * held during DAI stream ops and module_list/dai_list
+	 * access (gbaudio_module_update, gbcodec DAI ops)
+	 */
 	struct mutex lock;
+	/*
+	 * held during module register/unregister including
+	 * DAPM controls, widgets and routes
+	 */
 	struct mutex register_mutex;
 };
 
-- 
2.47.3

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
