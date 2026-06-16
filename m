Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eKheN85mMWocigUAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Jun 2026 17:07:58 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 75758690C61
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Jun 2026 17:07:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=GXr6u9pp;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9212D40A7D
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Jun 2026 15:07:57 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	by lists.linaro.org (Postfix) with ESMTPS id 1F1E240A20
	for <greybus-dev@lists.linaro.org>; Tue, 16 Jun 2026 07:42:51 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5176bbb9384so47301801cf.1
        for <greybus-dev@lists.linaro.org>; Tue, 16 Jun 2026 00:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781595770; x=1782200570; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v3vSm8eD6FMJPEneyrT8INZ/0kUYiIyKIleKMlOU9h8=;
        b=GXr6u9ppb+jHcFYegkBTPZoMMs1wCZdvQfh1QwUaGebFZCfdB7GFZ7m/IftweaC0LT
         LXrzqoF7du1NFpYVn7pfQiD+GVlVJRNq0cy3k2DzkeIifKXcOKp4+OWW7Noq6jWmKFeI
         XaugYE20UUdKmaRPa9nzd0KzciWMdmW7QJzLuZWBip1Sv+fJ5UMyxtJ/wMexiyYIZEtJ
         Cy2QVrXAHwbW/LYaMhbe4bVXsXZIONif1wZu0JFJaypF3Iwj3qYmZ4guEWHAIlkgXChj
         d0C4lM8B9v5iUlHwnOBSH9fN+hfeUqa99G9YU05w9/NbZmIub37pLJ45z+PSbHJI7lHr
         eD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781595770; x=1782200570;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v3vSm8eD6FMJPEneyrT8INZ/0kUYiIyKIleKMlOU9h8=;
        b=GxOJc6TDz2xB+tVHTJ6VkI3Mrc9+5OIM5GSwM/dHtTcu16iHZ0gpjagyQcNRyUd2K5
         FoXWj1/zmIInGrOUIRzF6hL12pPqb6+DJGcb0oN+w1s5y+85IEJsEoI3AH1Weoe5l45h
         oUZ9GqMw67XQ6wa+JRRC42jiO3yZj+uoSIiASoYGDTh8MiToV9euG6yhNQIf+n9qxG6h
         otscDqcvEaJkri5ANSQQiEtQ7h/D4eVbEqf0muXvT9f1/ddADgU+zxflW4FJIKqsi1Vz
         3DglG976ZCD3vrjmMnkdI340/xzWbz74mz/gJmbNcoY3VoeexitEq2UujaYUT+jjhWu4
         n9gg==
X-Forwarded-Encrypted: i=1; AFNElJ+jN1zIhulj0aq130gGNazrAGw2FRNN1m4rnL/RJJMpxdhr/i8mR2k3liy9GP5569UWxNIcurPP99YTiw==@lists.linaro.org
X-Gm-Message-State: AOJu0YwxyTj1GfSiHaZ3f+fqWU//51KMTq6dhfFM5SUlKgnMScBYxSZr
	agmlrytRyLGAPGKxSU0CuwQgqNvB+9nKAjjdcmzni5UokJ81F4mBgtGb
X-Gm-Gg: Acq92OEg9eYjVg/qgAfmGg4uF1DvOQSLfXN7n9lo5oSf9b56IzsKfR6/QfgeQ/ql2XV
	Y/4OUtJDIuJemsmXyJ4MqH/VpaXBjck9BrQp/zzHmAQHrpt76frFIjPsPA1ooUekKjNJzoUKYxn
	QZAhsxGrFFsJTK7BJM2u532RJL0jkROFEprDk/Mn3gDOui9NhrY5Q01oTK6peLo3MVci+P1U3O5
	oOjnJu/PlMnCefF6uNYWME7chO1utUNlwxjCSJ8iQTClQ6bi2HHWidb9XtuyTVCSER8V/QvsgC0
	PHYMZYWnLDvXbSLfZgSklxmqLCrVkQfvAtEa17kJVFFJqzms1nyEzVidbOmuyVYCTOmdUU3QbfU
	Nu30m4B3Ds+8/GSt0xzJJeC8WpOS+qvFLX0EpJ+PSi6Pc1wOt8P60PRK2o+No4QFn0iT3aLdCrd
	UTZ3VPJHr53mExVfuhGzHIDMrGKME=
X-Received: by 2002:a05:622a:487:b0:517:82a1:adf1 with SMTP id d75a77b69052e-51991592438mr34332981cf.15.1781595770695;
        Tue, 16 Jun 2026 00:42:50 -0700 (PDT)
Received: from localhost ([43.225.189.75])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb6428a6sm154779031cf.12.2026.06.16.00.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 00:42:49 -0700 (PDT)
Date: Tue, 16 Jun 2026 10:42:43 +0300
From: Dan Carpenter <error27@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <ajD-c6_n-ZSHAk_l@stanley.mountain>
References: <20260616-b4-disp-4352e8b0-v1-1-3e09f62e0ad5@proton.me>
 <2026061643-crowbar-handgrip-620d@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2026061643-crowbar-handgrip-620d@gregkh>
X-Spamd-Bar: ----
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: AU57J5AAJ5NMQFIH2VK6VRSDD6JV3NV7
X-Message-ID-Hash: AU57J5AAJ5NMQFIH2VK6VRSDD6JV3NV7
X-Mailman-Approved-At: Tue, 16 Jun 2026 15:07:46 +0000
CC: hexlabsecurity@proton.me, Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org, Alex Elder <elder@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: audio: bound the topology section sizes against the fetched size
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/AU57J5AAJ5NMQFIH2VK6VRSDD6JV3NV7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:hexlabsecurity@proton.me,m:johan@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-staging@lists.linux.dev,m:greybus-dev@lists.linaro.org,m:elder@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[error27@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,lists.linaro.org:from_smtp,linaro.org:email,stanley.mountain:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 75758690C61

On Tue, Jun 16, 2026 at 12:01:30PM +0530, Greg Kroah-Hartman wrote:
> On Tue, Jun 16, 2026 at 01:06:12AM -0500, Bryam Vargas via B4 Relay wrote:
> > ---
> >  drivers/staging/greybus/audio_gb.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> > 
> > diff --git a/drivers/staging/greybus/audio_gb.c b/drivers/staging/greybus/audio_gb.c
> > index 9d8994fdb41a..144591f1a512 100644
> > --- a/drivers/staging/greybus/audio_gb.c
> > +++ b/drivers/staging/greybus/audio_gb.c
> > @@ -37,6 +37,19 @@ int gb_audio_gb_get_topology(struct gb_connection *connection,
> >  		return ret;
> >  	}
> >  
> > +	/*
> > +	 * The size_* fields are supplied by the module and are used by
> > +	 * gbaudio_tplg_parse_data() to compute offsets into the blob; make
> > +	 * sure the sections fit within the fetched topology, so walking it
> > +	 * cannot read out of bounds.
> > +	 */
> > +	if ((u64)le32_to_cpu(topo->size_dais) + le32_to_cpu(topo->size_controls) +
> > +	    le32_to_cpu(topo->size_widgets) + le32_to_cpu(topo->size_routes) >
> > +	    size - sizeof(*topo)) {
> 
> Are you sure these checks will not overflow?


Yep.  The cast to u64 ensures that.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
