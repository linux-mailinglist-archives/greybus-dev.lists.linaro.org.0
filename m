Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B1ltAD1JJWqLGAIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sun, 07 Jun 2026 12:34:37 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 8610B64FCF3
	for <lists+greybus-dev@lfdr.de>; Sun, 07 Jun 2026 12:34:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=NoV2N0wl;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5236F40977
	for <lists+greybus-dev@lfdr.de>; Sun,  7 Jun 2026 10:34:35 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	by lists.linaro.org (Postfix) with ESMTPS id 772343F91B
	for <greybus-dev@lists.linaro.org>; Sat,  6 Jun 2026 07:08:55 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490b43e2b95so21709585e9.0
        for <greybus-dev@lists.linaro.org>; Sat, 06 Jun 2026 00:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780729734; x=1781334534; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oXB9BQNTN3pi9QGK7Hodfnr/DGugtVaRvxc41ybnc1o=;
        b=NoV2N0wlEfbdwObCd1ut0KsBhGcAYjkrpMrwtrdzLXfeFoOOgO60E9qPAibtjze343
         0QMkwNrYpoY+vmJ9VG4Fy7KOanJ78uV5md3YJ/kStZ8OGgDWnlKXJeeEq+vU6OrDLYHY
         r/Z1bL64qG5Gpxe6z1AgbvVyb0ZA/Nbr5uIZ25ILGQaUlAmNk00Zx7q4t1aig/ERCHTs
         imgiiP9GyFDQJgSenLitCkbH6afcrMHTa6kNsZFG9UAb31KhlE2HNjAAkYxYUwDefur3
         MsT6+3BxKW1fLugGeDEwWCO+MdpKtvl9tQyFHAEkWd1uFW4/0sfQdxd6ad28h5u2lVOB
         7wxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780729734; x=1781334534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oXB9BQNTN3pi9QGK7Hodfnr/DGugtVaRvxc41ybnc1o=;
        b=Y0bAZBCOZ8yx08xofl0VhWobij9RMcG51M0Y5guLs4FfhbdExuPn0b+dvH4mymXsLi
         /eg8xmEoTOrOFVpJCPJljf5NMD8ZvXnVK85q9rfJMAdo3khpUfs7UlbSrUBsJtYUBLdp
         YyCgnaihElKl4u2hX8JC62ZJHGhjHVAixzy5SJw/39OjZ9LqOlYpGfeVYeLvEHFRO7FO
         gWd5pqQ10oiOHlsYr8OH9EAux+g4jL++w7rYceGB7nIVfmbLqkIHw+f53C0NjC1E4y3z
         g9iiRIVJV9866qGsXGxSqaEzYP9Et+1+21+YIzPgKpjOmGDbqUyxmgto7tvdpt7Y2xru
         zTrQ==
X-Forwarded-Encrypted: i=1; AFNElJ/pAjLvYrh4qkYhTeAy8JV7xscYkKNxyGSdo/1FOeU09eqA3GVSI4VEiIk/Kx0DnxJX+NMKOtUKYT4xSQ==@lists.linaro.org
X-Gm-Message-State: AOJu0Yxn4/pfu/3msD6asAxBHKm4pAUvXf6U5HBq/xAhGCKMyvcbyMcY
	0k+jOzhbUkogsxzHfZEeDMklQjHla8ImHW8bEF+SXSQchRU74reksheK
X-Gm-Gg: Acq92OH0aiLpYp4nzg7KfxN9su48HrZvFHblghB2xopqWHgjTMOgntD2VhznoN61ded
	hks28ybp7O+3xiM5JYOW3Ie44sukpqpBoAei/EaprTrslZxs5YCShGGQVBsQuGexsLDuWxY7lrI
	J8VuQly99dffpK5vq/AAxf1RmawN/u7ApaETZoUn+/1+Vgp7suGKb2dGkJl/LT/1O5Za8x3McvC
	7FemI+Z0o8Ss79FnygBDj1yukwTtGPiLfKKJQhhH9netyT7PUHWvDKWsaDAqnd7t4E5B/Y+fRDd
	Qm6dzVxPpjMX7bKmL3jq0bvwFSu+XxTaiIob9lVPMvuzZVOTxuICKReeJDTtPAOXgiUt8AwuWD8
	FSEnrFXRj+0ylAJD0T1qmqxuNntFVoHqV88rKkZSAuUQoZJUQtUgqp6Xni2p3XmpJu0CT53U2iy
	bmxNM4PBgJONxznviy1l98pwys2+DR7w==
X-Received: by 2002:a05:600c:1907:b0:490:b99c:9337 with SMTP id 5b1f17b1804b1-490c25a0800mr109044625e9.10.1780729734323;
        Sat, 06 Jun 2026 00:08:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dc577sm31925879f8f.3.2026.06.06.00.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 00:08:53 -0700 (PDT)
Date: Sat, 6 Jun 2026 10:08:50 +0300
From: Dan Carpenter <error27@gmail.com>
To: Rhys Tumelty <rhys@tumelty.co.uk>
Message-ID: <aiPHgttTk0bK563E@stanley.mountain>
References: <20260605192857.78944-1-rhys@tumelty.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260605192857.78944-1-rhys@tumelty.co.uk>
X-Spamd-Bar: ---
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 4IMC7KMZORBEERPPD53IWXG4D4RC4IS5
X-Message-ID-Hash: 4IMC7KMZORBEERPPD53IWXG4D4RC4IS5
X-Mailman-Approved-At: Sun, 07 Jun 2026 10:34:26 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: audio: fix snprintf truncation errors
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/4IMC7KMZORBEERPPD53IWXG4D4RC4IS5/>
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
	DATE_IN_PAST(1.00)[27];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rhys@tumelty.co.uk,m:johan@kernel.org,m:elder@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[error27@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8610B64FCF3

On Fri, Jun 05, 2026 at 08:28:56PM +0100, Rhys Tumelty wrote:
> change snprintf() to scnprintf() in both gbaudio_tplg_create_widget()
> and gbaudio_tplg_process_kcontrols() to prevent potential string
> truncation warnings when prefixing the device id to the control name.
> 

This commit message is unclear.  My understanding is that snprintf()
is complaining that the array size of w->name is less than the array
size of "GB %d %s" plus the array size of temp_name.  This is a W=1
complaint.

I hate this warning.  We use snprintf() to deliberately truncate
the string.  Now it's complaining that the string might be truncated.
Oh no!  What we want to happen might happen!  This is the same argument
that people used to block safer alternatives to strcpy() into glibc
because "it's still going to truncate the string and that's equally
bad as a root exploit!"

First of all, the string is not going to be truncated.  (I haven't
looked).  Second of all, this warning makes no sense in the kernel.
I have never once had a bug which I failed to debug because the
last two bytes in a string were truncated.  There has never been a
scenario where I was looking through dmesg and snprintf() truncated
some bytes so I couldn't guess what I was looking at.

So your solution is to change it to scnprintf() which is kernel only
and GCC doesn't know about it...  I bet GCC eventually learns about
scnprintf() and it eventually becomes a warning again.

A better solution is to disable that annoying check.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
