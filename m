Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 48KfLSM9PWq3zwgAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 25 Jun 2026 16:37:23 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 547096C6B7B
	for <lists+greybus-dev@lfdr.de>; Thu, 25 Jun 2026 16:37:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=JTShXTd1;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6B72F40B04
	for <lists+greybus-dev@lfdr.de>; Thu, 25 Jun 2026 14:37:22 +0000 (UTC)
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	by lists.linaro.org (Postfix) with ESMTPS id A2FCE3F99D
	for <greybus-dev@lists.linaro.org>; Thu, 25 Jun 2026 10:46:02 +0000 (UTC)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-30c591fb1cbso3087166eec.1
        for <greybus-dev@lists.linaro.org>; Thu, 25 Jun 2026 03:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782384362; x=1782989162; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCM013gVUsehWEh08mLTPsFaPHwwdbfEWMEh5CAkbII=;
        b=JTShXTd1xIv0gIIj0aL2N1rtGQlPlu5A/WImyJraPr12z+fIAdgQtpfdsLsvc3ZeW5
         JqV7wmKqrycOYjdQg5qu3vNSZahncooUg8gZ35ECd27Aw4mLLI05Pas9yfWHs/hQqTGC
         lvTu7fo0yfA4Gam0qexlYKhuI4lybIZ+a1AuIjoOFAXRP0Vizbx4e4FKP0c7fOeC6pqY
         KA2Az15TduDem1CYsEH1cNPURgLZXkTtVO5I1fheu5bM7IT0vPPTbxIRB8yIs/VclsYE
         jAuJRWwjZ5IqJRbTwH7aMZaHek+4jtCV2kH8EVP3zBSbcu9PfJ4qTg2KhVPitCogB+EL
         /6ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782384362; x=1782989162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UCM013gVUsehWEh08mLTPsFaPHwwdbfEWMEh5CAkbII=;
        b=UJ5jGErhGvoFZwsAdf3Tc/6H3vaxTcBW6z2WiwoOZQydDdrcKlVhMdPk0NrhKJezM2
         lApEsztfhvB7VuH3U5m5chSVSL7PZubjeyvjX2ZuQUcQ1LHewz9ATmlh90fCEGghNJ5o
         ECB+i7AgAmYPB4TPhMOFmpy5kAAF6UbJdprvi2Dr9Wsb0yT+y7bY/yd24ortjd/svB1p
         OGba5FBce8hsuBVib4Ls7rv02q4JLcEK37BxLTDx+Ue6zcRUOW9i3h1SKuW5IP0700S8
         9oWAndNCifi92mlhRGJH6NUo8GPTVQozY6ROrVlP9k1cftincQwReoWfLWyVJEOnewme
         2Aug==
X-Forwarded-Encrypted: i=1; AHgh+RrXieZ/Ul/aOPW+jRDEE3H/vakXFfJLPZdrX1DjzCg4QbGRRV16gWW316RTN+z2qBs0GV+7f+4mKEriAw==@lists.linaro.org
X-Gm-Message-State: AOJu0YzDyMroeGUxk6eginwkvP6SJbhtXRlL0hSgyd7V0gO3XkrvxcN8
	43FojtsRJY6ARKICRPaSwDxdbYFWYxQpDmo5BuOU+Wqm7/FBrDnjyzNR
X-Gm-Gg: AfdE7clc+cBKJruNLi/qPirj4gBuNBSx4rFpz2U4hpCK0FyjazjOVlZ8bEZma3kOl5M
	n24qMZswswNWYrTbPHRB9wWP+Z6LolgDK67znxz/7m1dwW86OsgGX1OP6bvCD0Zt9wF0xMjwS3d
	vWitiWtFbhUOu3m+FwT7aNlX3/2Fpv9F7qzIirKcegUwzZUbU5Kw89tI5nJvgmamqMnScmuSesG
	LCOzzkceNdRxrchqPYCmrigRIqHG85blfqkW1dRnsKAa3r8L+kFm9esB2f5M3QdjsNzprItOUo/
	2LqKpGMA9jEYiuh+Imj0TowmQBGR9imjNXtMNMH9cxlIDYPVsV4Hngb3Z1gLpj4mgz72pQWDm1I
	yfvaSnTw5x7Q4HczTeZNABs0S5WYmMzEDHcRCP68ndcuTSZSdMZZJGWliwPTvyimu5g26xi9DFX
	dGO/aXN/wfugzoumIKYqsxwoPS2m27REDQEA==
X-Received: by 2002:a05:7300:e410:b0:30c:25fb:d28f with SMTP id 5a478bee46e88-30c84d81ba5mr2150281eec.25.1782384361612;
        Thu, 25 Jun 2026 03:46:01 -0700 (PDT)
Received: from 10-86-27-11.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c8c02a2a2sm4116511eec.2.2026.06.25.03.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:46:01 -0700 (PDT)
From: suryasaimadhu <suryasaimadhu369@gmail.com>
To: error27@gmail.com
Date: Thu, 25 Jun 2026 18:45:20 +0800
Message-ID: <20260625104520.288129-1-suryasaimadhu369@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <aj0CZOUlYlJydfPd@stanley.mountain>
References: <aj0CZOUlYlJydfPd@stanley.mountain>
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: suryasaimadhu369@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: LTOX4ESB5JFQR23MW3CMX4HQGZBE2MQX
X-Message-ID-Hash: LTOX4ESB5JFQR23MW3CMX4HQGZBE2MQX
X-Mailman-Approved-At: Thu, 25 Jun 2026 14:37:01 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, suryasaimadhu <suryasaimadhu369@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] staging: greybus: add comments to mutex declarations
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LTOX4ESB5JFQR23MW3CMX4HQGZBE2MQX/>
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
X-Rspamd-Queue-Id: 547096C6B7B

Add comments to mutex members in gbaudio_codec_info struct
to describe what each mutex protects, as recommended by checkpatch.

Signed-off-by: suryasaimadhu <suryasaimadhu369@gmail.com>
---
 drivers/staging/greybus/audio_codec.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.h b/drivers/staging/greybus/audio_codec.h
index f3f7a7ec6..326770b99 100644
--- a/drivers/staging/greybus/audio_codec.h
+++ b/drivers/staging/greybus/audio_codec.h
@@ -70,8 +70,8 @@ struct gbaudio_codec_info {
 	struct list_head module_list;
 	/* to maintain runtime stream params for each DAI */
 	struct list_head dai_list;
-	struct mutex lock;
-	struct mutex register_mutex;
+	struct mutex lock; /* protects module_list and dai_list */
+	struct mutex register_mutex; /* protects module registration */
 };
 
 struct gbaudio_widget {
-- 
2.47.3

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
