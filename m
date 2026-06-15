Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dvnCKXqyL2qdEgUAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 10:06:18 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 176D8684668
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 10:06:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=linuxfoundation.org header.s=korg header.b="K9ewA/j+";
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=linuxfoundation.org (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DF6FF409FC
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 07:57:17 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 4FC05402FF
	for <greybus-dev@lists.linaro.org>; Mon, 15 Jun 2026 07:57:12 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B4F5E41777;
	Mon, 15 Jun 2026 07:57:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E42631F000E9;
	Mon, 15 Jun 2026 07:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781510231;
	bh=6zm2KOtk7g62DkYhDBfMMzUoEBfhqmX9G3ep+9Vh1hk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K9ewA/j+GMS+ptnwYONjl1ZU5eXdee3M0Lu4MDkorgArLJtXDsreXvY4WhWjoJXL5
	 VMeSggaKUmvJQjzqwMk1cUkOkk/n+3n+fz5PUouJrM+7utbPaQml9qMM3qMPiNQqsh
	 p1JAarfUjPXV1u4aw0xCrp7W7eZEXMv1M8ZiHJDg=
Date: Mon, 15 Jun 2026 09:56:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Michail Tatas <michail.tatas@gmail.com>
Message-ID: <2026061510-backpack-skimmer-12bc@gregkh>
References: <ahdNZlYqnTO22tQq@michalis-linux>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ahdNZlYqnTO22tQq@michalis-linux>
X-Spamd-Bar: /
Message-ID-Hash: Q6MFWANZU22ZX5SZAPTVFE2TRMVNJJOU
X-Message-ID-Hash: Q6MFWANZU22ZX5SZAPTVFE2TRMVNJJOU
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Remove unused macro
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/Q6MFWANZU22ZX5SZAPTVFE2TRMVNJJOU/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: add header
X-Spamd-Result: default: False [6.59 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:michail.tatas@gmail.com,m:pure.logic@nexus-software.ie,m:johan@kernel.org,m:elder@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:michailtatas@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:from_mime,linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns,lists.linaro.org:from_smtp,gregkh:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 176D8684668
X-Spam: Yes

On Wed, May 27, 2026 at 11:00:38PM +0300, Michail Tatas wrote:
> Remove unused macro as indicated by the compiler
> when building with make W=2

W=2 even works for staging drivers?  I wouldn't worry about that at all :)

> Signed-off-by: Michail Tatas <michail.tatas@gmail.com>
> ---
>  drivers/staging/greybus/loopback.c | 26 --------------------------
>  1 file changed, 26 deletions(-)
> 
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index 4d085d3cd471..7442b1c4e86c 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -167,32 +167,6 @@ static DEVICE_ATTR_RO(name##_avg)
>  	gb_loopback_ro_stats_attr(field, max, u);		\
>  	gb_loopback_ro_avg_attr(field)
>  
> -#define gb_loopback_attr(field, type)					\
> -static ssize_t field##_show(struct device *dev,				\
> -			    struct device_attribute *attr,		\
> -			    char *buf)					\
> -{									\
> -	struct gb_loopback *gb = dev_get_drvdata(dev);			\
> -	return sysfs_emit(buf, "%" #type "\n", gb->field);			\
> -}									\
> -static ssize_t field##_store(struct device *dev,			\
> -			    struct device_attribute *attr,		\
> -			    const char *buf,				\
> -			    size_t len)					\
> -{									\
> -	int ret;							\
> -	struct gb_loopback *gb = dev_get_drvdata(dev);			\
> -	mutex_lock(&gb->mutex);						\
> -	ret = sscanf(buf, "%"#type, &gb->field);			\
> -	if (ret != 1)							\
> -		len = -EINVAL;						\
> -	else								\
> -		gb_loopback_check_attr(gb, bundle);			\
> -	mutex_unlock(&gb->mutex);					\
> -	return len;							\
> -}									\
> -static DEVICE_ATTR_RW(field)

I see why this is present, it makes it more uniform.  That being said,
as it's not being used anywhere, I can understand the confusion even if
there is not any produced code difference at all.

I'll queue this up after -rc1 is out.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
