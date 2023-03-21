Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2276C30A8
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 12:46:09 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BE22C43CB2
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 11:46:07 +0000 (UTC)
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	by lists.linaro.org (Postfix) with ESMTPS id F098143CB2
	for <greybus-dev@lists.linaro.org>; Tue, 21 Mar 2023 11:46:02 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=inria.fr header.s=dc header.b=o4qCyQ4r;
	spf=pass (lists.linaro.org: domain of julia.lawall@inria.fr designates 192.134.164.83 as permitted sender) smtp.mailfrom=julia.lawall@inria.fr;
	dmarc=pass (policy=none) header.from=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=BaVu1ranY6IZPO5w8T3/AsoEgjpGKi9wefT7ScLRJzA=;
  b=o4qCyQ4rHz0HLQOMuw4m39RYMAtYSRZb8iuaciFdXgRTUtZTdFHRfgS/
   i1VstiE4iqZZPpF4+iWQv7brhOTXObHvgxd8eZNKJJraZz5wQugsVzKgC
   8vLlcs2rIq7PDZl7Tq+YBKgjG7I891md9gtQXBqkwIG+wJqGMgt0U7hpd
   8=;
X-IronPort-AV: E=Sophos;i="5.98,278,1673910000";
   d="scan'208";a="98275290"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 12:46:01 +0100
Date: Tue, 21 Mar 2023 12:46:01 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <cover.1679352669.git.eng.mennamahmoud.mm@gmail.com>
Message-ID: <ee77a227-13bd-70ad-1d8e-f9719970e0f8@inria.fr>
References: <cover.1679352669.git.eng.mennamahmoud.mm@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: F098143CB2
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[inria.fr,none];
	R_SPF_ALLOW(-0.20)[+ip4:192.134.164.0/24];
	R_DKIM_ALLOW(-0.20)[inria.fr:s=dc];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_ONE(0.00)[1];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:2200, ipnet:192.134.164.0/24, country:FR];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[inria.fr:+];
	FREEMAIL_CC(0.00)[linuxfoundation.org,lists.linux.dev,kernel.org,gmail.com,pengutronix.de,lists.linaro.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[]
Message-ID-Hash: 63762BDBQTNJLYDITH24AQJ7NRSFTZ3C
X-Message-ID-Hash: 63762BDBQTNJLYDITH24AQJ7NRSFTZ3C
X-MailFrom: julia.lawall@inria.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, vireshk@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 0/3] edits in greybus driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/63762BDBQTNJLYDITH24AQJ7NRSFTZ3C/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Tue, 21 Mar 2023, Menna Mahmoud wrote:

> This patchset includes change happened in greybus driver in three
> different files two of them patch one and three related to
> checkpatch issue and in second patch convert two
> `container_of` macros into inline functions.
>
> Menna Mahmoud (3):
>   staging: greybus: remove unnecessary blank line
>   staging: greybus: use inline function for macros
>   staging: greybus: remove unnecessary blank line

Different patches should have different subject lines.  You need to either
be more specific about the file affected or merge the two patches with the
same subject into one.

julia

>
>  drivers/staging/greybus/gbphy.h                  | 10 ++++++++--
>  drivers/staging/greybus/greybus_authentication.h |  1 -
>  drivers/staging/greybus/pwm.c                    |  1 -
>  3 files changed, 8 insertions(+), 4 deletions(-)
>
> --
> 2.34.1
>
>
>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
