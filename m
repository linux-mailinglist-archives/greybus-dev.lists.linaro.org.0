Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBA26EA1E0
	for <lists+greybus-dev@lfdr.de>; Fri, 21 Apr 2023 04:51:02 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 823A83F97F
	for <lists+greybus-dev@lfdr.de>; Fri, 21 Apr 2023 02:51:01 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	by lists.linaro.org (Postfix) with ESMTPS id C21123EC16
	for <greybus-dev@lists.linaro.org>; Fri, 21 Apr 2023 02:50:55 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20221208 header.b=JjUnbLxt;
	spf=pass (lists.linaro.org: domain of htejun@gmail.com designates 209.85.210.177 as permitted sender) smtp.mailfrom=htejun@gmail.com;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=kernel.org (policy=none)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-63d2ba63dddso1519743b3a.2
        for <greybus-dev@lists.linaro.org>; Thu, 20 Apr 2023 19:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682045455; x=1684637455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZd1f2A/dHMRVFWDYKTVlcM/K09Kp/NZDEzNt1pICiQ=;
        b=JjUnbLxt1gWtb1QGpTKbuG9EbQaQbfiV1lE2b9kWYLdkgiKRAQlLXv/MlBL38U2wRb
         mBGgmlt+dD/c6WSgRZFG2bcSK6CvQ3/oO4UoB6f8TfRZyPKcb3tc1LHQUAr3puB9TpkQ
         rfVwglC+yLSTxnSj9AH/RfNxy3RMR0J08NTMiE5Pecdr10VBHBvSIzUTXC0/FK5a4B9P
         cppn3vl/c5qH8w0RDslEkXuvgEjsLbFiFCf6McyoknkZgZTRH0ib+0nQMUBnbNKuuDpM
         Njeu075OowgSpTzoifm4E5WTbkrHaWa4sR2SbaiuXIXOTpipzsgh+R9jwYK1IETsIatN
         APFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682045455; x=1684637455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iZd1f2A/dHMRVFWDYKTVlcM/K09Kp/NZDEzNt1pICiQ=;
        b=dfw3c2lOKIRU19x3FGdZKwkJTrZpJe8qSP80uwsyanVb1Gani5GkXBdV9tja+NXfZ1
         sHBPVBM4vU5yVKhmrLlvCLPiWphqrS2Q1znFxe+1JFnyB1p+e2ka/8V0lyhDzY9Ko9ML
         QBStCAQxR/90kVbq9Mdm5LKKTUnHA37uupMW/zvLj3kuV86flf6mw3fzxWw9NrFT82Y5
         3dmFotWXu5xckm+1Ai9UAsCylKtH1XKdYMnq2WTYrAMVtduYI+csnvYkaF/fd3fXpPZP
         E1SmSjViPBA16cB/dQ4lQVWjec02HzJBQqXHMfLqKMywxtBoU6h95anFF6Vu2ab922TM
         f4iw==
X-Gm-Message-State: AAQBX9en8X8OMSsMdxZRdSunSIOXOw1PdUKoBzjiJN466pXnmwNNxaKp
	AjQlCyMbSUVcA1nshb1N1Sg=
X-Google-Smtp-Source: AKy350YpYE5/bzDyZU8nyoNtqlL5ZKpi+ul4SY/Wh6L+xmh0jK+re7sRldnhJFEBy6jH2H8UGlC6hA==
X-Received: by 2002:a05:6a20:e619:b0:f0:4664:ad53 with SMTP id my25-20020a056a20e61900b000f04664ad53mr4774783pzb.48.1682045454474;
        Thu, 20 Apr 2023 19:50:54 -0700 (PDT)
Received: from localhost (2603-800c-1a02-1bae-a7fa-157f-969a-4cde.res6.spectrum.com. [2603:800c:1a02:1bae:a7fa:157f:969a:4cde])
        by smtp.gmail.com with ESMTPSA id a22-20020a056a000c9600b00628e9871c24sm1886589pfv.183.2023.04.20.19.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 19:50:54 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
From: Tejun Heo <tj@kernel.org>
To: jiangshanlai@gmail.com
Date: Thu, 20 Apr 2023 16:50:26 -1000
Message-Id: <20230421025046.4008499-3-tj@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421025046.4008499-1-tj@kernel.org>
References: <20230421025046.4008499-1-tj@kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-1.70 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	FORGED_SENDER(0.30)[tj@kernel.org,htejun@gmail.com];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20221208];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[kernel.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_NEQ_ENVFROM(0.00)[tj@kernel.org,htejun@gmail.com];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_HAS_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: C21123EC16
X-Spamd-Bar: -
Message-ID-Hash: ZC3K5COFQYMIGLBZLUTIKEFNPAKQSB5B
X-Message-ID-Hash: ZC3K5COFQYMIGLBZLUTIKEFNPAKQSB5B
X-MailFrom: htejun@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, kernel-team@meta.com, Tejun Heo <tj@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 02/22] greybus: Use alloc_ordered_workqueue() to create ordered workqueues
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZC3K5COFQYMIGLBZLUTIKEFNPAKQSB5B/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

BACKGROUND
==========

When multiple work items are queued to a workqueue, their execution order
doesn't match the queueing order. They may get executed in any order and
simultaneously. When fully serialized execution - one by one in the queueing
order - is needed, an ordered workqueue should be used which can be created
with alloc_ordered_workqueue().

However, alloc_ordered_workqueue() was a later addition. Before it, an
ordered workqueue could be obtained by creating an UNBOUND workqueue with
@max_active==1. This originally was an implementation side-effect which was
broken by 4c16bd327c74 ("workqueue: restore WQ_UNBOUND/max_active==1 to be
ordered"). Because there were users that depended on the ordered execution,
5c0338c68706 ("workqueue: restore WQ_UNBOUND/max_active==1 to be ordered")
made workqueue allocation path to implicitly promote UNBOUND workqueues w/
@max_active==1 to ordered workqueues.

While this has worked okay, overloading the UNBOUND allocation interface
this way creates other issues. It's difficult to tell whether a given
workqueue actually needs to be ordered and users that legitimately want a
min concurrency level wq unexpectedly gets an ordered one instead. With
planned UNBOUND workqueue updates to improve execution locality and more
prevalence of chiplet designs which can benefit from such improvements, this
isn't a state we wanna be in forever.

This patch series audits all callsites that create an UNBOUND workqueue w/
@max_active==1 and converts them to alloc_ordered_workqueue() as necessary.

WHAT TO LOOK FOR
================

The conversions are from

  alloc_workqueue(WQ_UNBOUND | flags, 1, args..)

to

  alloc_ordered_workqueue(flags, args...)

which don't cause any functional changes. If you know that fully ordered
execution is not ncessary, please let me know. I'll drop the conversion and
instead add a comment noting the fact to reduce confusion while conversion
is in progress.

If you aren't fully sure, it's completely fine to let the conversion
through. The behavior will stay exactly the same and we can always
reconsider later.

As there are follow-up workqueue core changes, I'd really appreciate if the
patch can be routed through the workqueue tree w/ your acks. Thanks.

Signed-off-by: Tejun Heo <tj@kernel.org>
Cc: Johan Hovold <johan@kernel.org>
Cc: Alex Elder <elder@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org
---
 drivers/greybus/connection.c | 4 ++--
 drivers/greybus/svc.c        | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/greybus/connection.c b/drivers/greybus/connection.c
index e3799a53a193..9c88861986c8 100644
--- a/drivers/greybus/connection.c
+++ b/drivers/greybus/connection.c
@@ -187,8 +187,8 @@ _gb_connection_create(struct gb_host_device *hd, int hd_cport_id,
 	spin_lock_init(&connection->lock);
 	INIT_LIST_HEAD(&connection->operations);
 
-	connection->wq = alloc_workqueue("%s:%d", WQ_UNBOUND, 1,
-					 dev_name(&hd->dev), hd_cport_id);
+	connection->wq = alloc_ordered_workqueue("%s:%d", 0, dev_name(&hd->dev),
+						 hd_cport_id);
 	if (!connection->wq) {
 		ret = -ENOMEM;
 		goto err_free_connection;
diff --git a/drivers/greybus/svc.c b/drivers/greybus/svc.c
index 16cced80867a..0d7e749174a4 100644
--- a/drivers/greybus/svc.c
+++ b/drivers/greybus/svc.c
@@ -1318,7 +1318,7 @@ struct gb_svc *gb_svc_create(struct gb_host_device *hd)
 	if (!svc)
 		return NULL;
 
-	svc->wq = alloc_workqueue("%s:svc", WQ_UNBOUND, 1, dev_name(&hd->dev));
+	svc->wq = alloc_ordered_workqueue("%s:svc", 0, dev_name(&hd->dev));
 	if (!svc->wq) {
 		kfree(svc);
 		return NULL;
-- 
2.40.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
