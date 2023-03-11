Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8D46B5CE6
	for <lists+greybus-dev@lfdr.de>; Sat, 11 Mar 2023 15:36:11 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 400293EE23
	for <lists+greybus-dev@lfdr.de>; Sat, 11 Mar 2023 14:36:10 +0000 (UTC)
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	by lists.linaro.org (Postfix) with ESMTPS id A11683EE23
	for <greybus-dev@lists.linaro.org>; Sat, 11 Mar 2023 14:36:02 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=inria.fr header.s=dc header.b="GlR/HC9k";
	spf=pass (lists.linaro.org: domain of julia.lawall@inria.fr designates 192.134.164.83 as permitted sender) smtp.mailfrom=julia.lawall@inria.fr;
	dmarc=pass (policy=none) header.from=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=jMouezBBL3soxbH8ICdrUfcoEX4o/23uUVRU1belL5g=;
  b=GlR/HC9kkXXaCptGLEXGraiUmvEnantMZ+bt+V1FCAVQEXVbs0ztVP1o
   uJgIqdmw2aE5Njv0KuVAIZsXZqEFSoiMyTyXc1EJaoVo0MmFVmYiNDMlg
   lKDSVceKin35Lt8rHYta2Idi2pCFAn5NjgNrLidLaWLclhyKpIIDEwHoo
   s=;
X-IronPort-AV: E=Sophos;i="5.98,252,1673910000";
   d="scan'208";a="96649449"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 15:36:01 +0100
Date: Sat, 11 Mar 2023 15:36:01 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <20230311135919.9129-1-eng.mennamahmoud.mm@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2303111532220.2802@hadrien>
References: <20230311135919.9129-1-eng.mennamahmoud.mm@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: A11683EE23
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[inria.fr,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:192.134.164.0/24];
	R_DKIM_ALLOW(-0.20)[inria.fr:s=dc];
	MIME_GOOD(-0.10)[text/plain];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:2200, ipnet:192.134.164.0/24, country:FR];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[inria.fr:+]
Message-ID-Hash: UCJZWM3F3NJM4IBTPUOQ4ADKSIX4QCMQ
X-Message-ID-Hash: UCJZWM3F3NJM4IBTPUOQ4ADKSIX4QCMQ
X-MailFrom: julia.lawall@inria.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: eclose macro in a do - while loop
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/UCJZWM3F3NJM4IBTPUOQ4ADKSIX4QCMQ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Menna,

There is a typo in the subject line.

On Sat, 11 Mar 2023, Menna Mahmoud wrote:

> " ERROR: Macros with multiple statements should be enclosed in a do -
> while loop"
>
> Reported by checkpath.
>
> do loop with the conditional expression set to a constant
> value of zero (0).This creates a loop that
> will execute exactly one time.This is a coding idiom that
> allows a multi-line macro to be used anywhere
> that a single statement can be used.
>
> So, enclose `gb_loopback_stats_attrs` macro in do - while (0) to
> fix checkpath error

The log message should focus on what is done and why.  The checkpatch
warning text and the fact that the problem was detected using checkpatch
is useful, but less, so it should come last, not first.

Here, what is done is to enclose a sequence of statements in a macro
definition in a do-while loop with a test expression 0.

The reason why is to make it safe to use the sequence anywhere a single
statement can be used.

A period at the end of a sentence should be followed by some whitespace
before starting the next sentence.

julia

> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
> ---
>  drivers/staging/greybus/loopback.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index 1a61fce98056..e86d50638cb5 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -162,10 +162,12 @@ static ssize_t name##_avg_show(struct device *dev,		\
>  }									\
>  static DEVICE_ATTR_RO(name##_avg)
>
> -#define gb_loopback_stats_attrs(field)				\
> -	gb_loopback_ro_stats_attr(field, min, u);		\
> -	gb_loopback_ro_stats_attr(field, max, u);		\
> -	gb_loopback_ro_avg_attr(field)
> +#define gb_loopback_stats_attrs(field)					\
> +	do { \
> +		gb_loopback_ro_stats_attr(field, min, u);		\
> +		gb_loopback_ro_stats_attr(field, max, u);		\
> +		gb_loopback_ro_avg_attr(field);				\
> +	} while (0)
>
>  #define gb_loopback_attr(field, type)					\
>  static ssize_t field##_show(struct device *dev,				\
> --
> 2.34.1
>
>
>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
